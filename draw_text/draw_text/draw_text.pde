final String FILE_NAME = "./test.txt";
PFont font = createFont("Menlo",64,true);
int      textY;           //テキスト表示縦位置
int      fontSize;        //文字サイズ
String    lineData[] = null;
void setup(){
  size( 200,200 );
  
  //表示フォントを設定  
  fontSize = 16;
  textFont( font,fontSize );
  textAlign( LEFT, TOP );
  
  //テキストファイルを読む
  lineData = loadStrings( FILE_NAME );
  if( lineData == null ){
    //読み込み失敗
    println( FILE_NAME + " 読み込み失敗" );
    exit();
  }
}
 
void draw(){
  background(255);
  textY = 0;
  
  //読み込んだ各行を画面に表示
  fill( 0 );
  for( int i = 0; i < lineData.length; i++ ){
    text( String.valueOf(i) + "：[" + lineData[i] + "]", 0, textY );
    textY = textY + fontSize;
  }
}
