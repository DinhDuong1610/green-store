package com.fourstars.greenstore.service.impl;

public interface QrCodeGeneratorService {
    boolean generateQRCode(String qrCodeContent, String filePath, int width, int height);
}
