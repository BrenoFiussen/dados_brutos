import processing.serial.*; //Biblioteca importante para essa aplicação
Serial mySerial; //Funcionalidade serial
PrintWriter output; //Funcionalidade de escrita em arquivos

void setup() {
  String portName = Serial.list()[1]; //configura a porta serial
  mySerial = new Serial(this, portName, 9600); //Configura a porta serial
  output = createWriter( "e10.txt" ); //Cria o objeto arquivo para gravar os dados
}

void draw() { //Mesma coisa que a funçao loop do Arduino
  if (mySerial.available() > 0 ) { //Se receber um valor na porta serial
    String value = mySerial.readStringUntil('\n'); //Le o valor recebido
    if ( value != null ) { // Se o valor nao for nulo
      output.print(value); //value é o valor recebido pela porta serial (valor que o LDR enviou)
      output.flush(); // Termina de escrever os dados pro arquivo
    }
  }
}

void keyPressed() { //Se alguma tecla for pressionada
  output.flush(); // Termina de escrever os dados pro arquivo
  output.close(); // Fecha o arquivo
  exit(); // Para o programa
}
