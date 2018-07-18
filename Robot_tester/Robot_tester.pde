
import processing.serial.*;

Serial myPort;        // The serial port
float inByte = 0;
int numValues = 12;
float[] values = new float[numValues];

void setup () 
  {
  //Tamaño de ventana
  size(1600,900);

  // List all the available serial ports
  // if using Processing 2.1 or later, use Serial.printArray()
  println(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  Arduino, so I open Serial.list()[0].
  // Open whatever port is the one you're using.
  myPort = new Serial(this, Serial.list()[0], 9600);

  // don't generate a serialEvent() unless you get a newline character:
  myPort.bufferUntil('\n');

  // set inital background:
  background(255);
  
  }




void draw () {
  background(255);
  inByte = values[0];

  line_sensor_text(0,0); // Line sensors values( Coordinate_X, Coordinate_Y ) 

}

void line_sensor_text(int x, int y)
{
  fill(0);
  textSize(22);
  text(values[0], 10+x, 30+y);
  textSize(22);
  text(values[1], 190+x, 30+y);
  textSize(22);
  text(values[2], 370+x, 30+y);
}


void serialEvent(Serial myPort) { 
  try {
    // get the ASCII string:
    String inString = myPort.readStringUntil('\n');
    //println("raw: \t" + inString); // <- uncomment this to debug serial input from Arduino

    if (inString != null) {
      // trim off any whitespace:
      inString = trim(inString);

      // split the string on the delimiters and convert the resulting substrings into an float array:
      values = float(splitTokens(inString, ", \t")); // delimiter can be comma space or tab

      // if the array has at least the # of elements as your # of sensors, you know
      //   you got the whole data packet.
      if (values.length >= numValues) {
        /* you can increment xPos here instead of in draw():
        xPos++;
        if (xPos > width) {
          xPos = 0;
          clearScreen = true;
        }
        */
      }
    }
  }
  catch(RuntimeException e) {
    // only if there is an error:
    e.printStackTrace();
  }
  
 /* print(values[0]);
  print(",");
  print(values[1]);
  print(",");
  print(values[2]);
  println("");*/
}
