import processing.serial.*;

Serial myPort;        // The serial port

void setup()
{
  //Window size
  size(1280,720);

  // List all the available serial ports
  // if using Processing 2.1 or later, use Serial.printArray()
  // println(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  // myPort = new Serial(this, Serial.list()[0], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  // myPort.bufferUntil('\n');

  // set inital background:
  background(255);
}