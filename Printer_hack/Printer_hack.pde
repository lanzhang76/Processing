PImage img ;

void setup(){
  img      = loadImage("try2.jpg");
  processImage();
}

void processImage() {

  int         pixelNum, byteNum, bytesOnLine = 99,
              x, y, b, rowBytes, totalBytes, lastBit, sum;
   // Calculate output size
  rowBytes   = (img.width + 7) / 8;
  totalBytes = rowBytes * img.height;
    // Convert image to B&W, make pixels readable
  img.filter(THRESHOLD);
  img.loadPixels();
  
  
for(pixelNum=byteNum=y=0; y<img.height; y++) { // Each row...
    for(x=0; x<rowBytes; x++) { // Each 8-pixel block within row...
      lastBit = (x < rowBytes - 1) ? 1 : (1 << (rowBytes * 8 - img.width));
      sum     = 0; // Clear accumulated 8 bits
      for(b=128; b>=lastBit; b >>= 1) { // Each pixel within block...
        if((img.pixels[pixelNum++] & 1) == 0) sum |= b; // If black pixel, set bit
      }
      if(++bytesOnLine >= 10) { // Wrap nicely
          //output.print("\n ");
          bytesOnLine = 0;
      }
      //output.format(" 0x%02X", sum); // Write accumulated bits
      String test =  String.format(" 0x%02X", sum);
      println(test);
      //if(++byteNum < totalBytes) output.print(',');
    }
  }
 println("Done!"); 
}
