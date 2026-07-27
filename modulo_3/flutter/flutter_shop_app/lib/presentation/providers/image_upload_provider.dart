// lib/presentation/providers/image_upload_provider.dart

import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/local/secure_storage.dart';
import '../../data/remote/api/image_upload_service.dart';

// ---------------------------------------------------------------------------
// Estado
// ---------------------------------------------------------------------------

/// Estado del proceso de subida de imágenes.
sealed class ImageUploadState {
  const ImageUploadState();
}

/// Estado inicial o tras resetear.
class ImageUploadIdle extends ImageUploadState {
  const ImageUploadIdle();
}

/// Subida en progreso.
class ImageUploadLoading extends ImageUploadState {
  const ImageUploadLoading();
}

/// Subida completada con éxito.
class ImageUploadSuccess extends ImageUploadState {
  const ImageUploadSuccess({required this.imageUrl});

  /// URL absoluta de la imagen subida (puede ser null si el API no la devuelve).
  final String? imageUrl;
}

/// Error en la subida.
class ImageUploadError extends ImageUploadState {
  const ImageUploadError({required this.message});
  final String message;
}

// ---------------------------------------------------------------------------
// Notifier
// ---------------------------------------------------------------------------

class ImageUploadNotifier extends StateNotifier<ImageUploadState> {
  ImageUploadNotifier({
    ImageUploadService? service,
    ImagePicker? picker,
  })  : _service = service ?? ImageUploadService(),
        _picker = picker ?? ImagePicker(),
        super(const ImageUploadIdle());

  final ImageUploadService _service;
  final ImagePicker _picker;

  // -------------------------------------------------------------------------
  // Privados
  // -------------------------------------------------------------------------

  /// Muestra el bottom sheet de selección de fuente y devuelve el archivo.
  /// Devuelve null si el usuario cancela.
  Future<File?> _pickImage() async {
    print('DEBUG: Iniciando selección de imagen en la galería...');
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,     // Compresión leve para reducir tamaño
      maxWidth: 1920,
      maxHeight: 1920,
    );

    if (picked == null) {
      print('DEBUG: La selección de imagen fue cancelada o retornó null');
      return null;
    }
    print('DEBUG: Imagen seleccionada correctamente. Path: ${picked.path}');
    return File(picked.path);
  }

  Future<void> _handleUpload(Future<String?> Function(File) upload) async {
    try {
      final file = await _pickImage();
      if (file == null) {
        // Usuario canceló la selección — no cambiar estado
        return;
      }

      print('DEBUG: Cambiando estado a ImageUploadLoading y subiendo archivo...');
      state = const ImageUploadLoading();

      final imageUrl = await upload(file);
      print('DEBUG: Subida exitosa. URL recibida: $imageUrl');
      state = ImageUploadSuccess(imageUrl: imageUrl);
    } on ImageUploadException catch (e) {
      print('DEBUG: Error esperado en la subida: ${e.message}');
      state = ImageUploadError(message: e.message);
    } catch (e, stackTrace) {
      print('DEBUG: Error inesperado en la subida: $e');
      print(stackTrace);
      state = ImageUploadError(
        message: 'Error inesperado: ${e.toString()}',
      );
    }
  }

  // -------------------------------------------------------------------------
  // API pública
  // -------------------------------------------------------------------------

  /// Selecciona una imagen de la galería y la sube como imagen del producto.
  Future<void> pickAndUploadProductImage(int productId) async {
    await _handleUpload(
      (file) => _service.uploadProductImage(productId: productId, file: file),
    );
  }

  /// Selecciona una imagen de la galería y la sube como avatar del usuario.
  Future<void> pickAndUploadAvatar() async {
    await _handleUpload(
      (file) => _service.uploadAvatar(file: file),
    );
  }

  /// Vuelve al estado inicial (útil tras mostrar error o éxito).
  void reset() => state = const ImageUploadIdle();
}

// ---------------------------------------------------------------------------
// Provider
// ---------------------------------------------------------------------------

/// Provider global para subida de imágenes.
///
/// Se usa `autoDispose` para limpiar el estado cuando ya no hay listeners
/// (p. ej. al navegar fuera de la pantalla).
final imageUploadProvider =
    StateNotifierProvider.autoDispose<ImageUploadNotifier, ImageUploadState>(
  (ref) {
    final storage = ref.watch(secureStorageProvider);
    return ImageUploadNotifier(
      service: ImageUploadService(storage: storage),
    );
  },
);
