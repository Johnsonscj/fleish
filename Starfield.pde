import java.io.IOException;
import java.io.File;
import java.util.Scanner;
import static java.lang.System.*; 
import java.io.FileNotFoundException;
boolean[] check = new boolean[4];
String[] hWords;
String[] sentences;
String[] tWords;
String[] pWords;
String[] sWords;
String[] sentences2;
String[] sentences3;
String[] sentences4;
double gradeLevel=0.0;
double gradeLevel2 =0.0;
double gradeLevel3 =0.0;
double gradeLevel4=0.0;
double count=0;
PFont f;
int j=0;
StringParser[] obj = new StringParser[4];
moveText[] obj2;
moveText[] obj3;
moveText[] obj4;
moveText[] obj5;
void setup() {
  f=createFont("Georgia", 48);

  text("word", 122, 60);
  String[] fontList = PFont.list();
  printArray(fontList);


  size(1000, 1000);
  fill(255);
  for (int i =0; i<check.length; i++) {
    check[i]=false;
  }
  String[] lines = loadStrings("book.dat"); //lines
  String[] lines2= loadStrings("TomSawyer.dat");
  String[] lines3 = loadStrings("ParadiseLost.dat");
  String[] lines4 = loadStrings("sam.dat");

  String tSawyer = join(lines2, " ");
  String pLost = join(lines3, " ");
  String hFinn = join(lines, " "); //entire play in one string
  String sJ= join(lines4, " ");

  sentences= splitTokens(hFinn, ".");
  sentences2=splitTokens(tSawyer, ".");
  sentences3 = splitTokens(pLost, ".");
  sentences4 = splitTokens(sJ, ".");

  hWords=splitTokens(hFinn, ",._?-\'!\": ");
  tWords=splitTokens(tSawyer, ",._?-\\'\\!\\\\: \" ");
  pWords=splitTokens(pLost, ",._?-\\'\\!\\\\: \"");
  sWords=splitTokens(sJ, ",._?-\'!\": ");


  obj[0] = new StringParser(hWords);
  obj[1] = new StringParser(tWords);
  obj[2] = new StringParser(pWords);
  obj[3] = new StringParser(sWords);


  gradeLevel=.39*(hWords.length/sentences.length) + 11.8*(obj[0].countSyllables()/hWords.length)-15.59;
  gradeLevel2=.39*(tWords.length/sentences2.length) + 11.8*(obj[1].countSyllables()/tWords.length)-15.59;
  gradeLevel3 =.39*(pWords.length/sentences3.length) + 11.8*(obj[2].countSyllables()/pWords.length)-15.59;
  gradeLevel4 =.39*(sWords.length/sentences4.length) + 11.8*(obj[3].countSyllables()/sWords.length)-15.59;
  obj2= new moveText[sWords.length];
  obj3= new moveText[hWords.length];
  obj4= new moveText[tWords.length];
  obj5= new moveText[pWords.length];
  for (int i =0; i<sWords.length; i++) {
    obj2[i]= new moveText(sWords[i]);
  }
  for (int i =0; i<hWords.length; i++) {
    obj3[i]= new moveText(hWords[i]);
  }
  for (int i =0; i<tWords.length; i++) {
    obj4[i]= new moveText(tWords[i]);
  }
  for (int i =0; i<pWords.length; i++) {
    obj5[i]= new moveText(pWords[i]);
  }
}

void draw() {
  background(255, 255, 255);
  fill(255, 0, 0);
  textFont(f);

  noStroke();




  if (check[0]) {

    fill(100, 0, 0);
    rect(0, 0, 500, 500);
    fill(255);
    textSize(50);
    text("Huck Finn ", 20, 100);
    textSize(30);
    text("# of syllables "+obj[0].countSyllables(), 20, 150);
    text("# of words "+hWords.length, 20, 200);
    text("# of sentences "+sentences.length, 20, 250);
    text("Flesch–Kincaid readability "+ (int)gradeLevel, 20, 300);
    obj3[j].move();
    obj3[j].show();
    if (obj3[j].getX()>950) {
      j++;
    }
  }
  if (check[1]) {

    fill(0, 150, 0);
    rect(500, 0, 500, 500);
    textSize(50);
    fill(0);
    text("Tom Sawyer  ", 520, 100);
    textSize(30);
    text("# of syllables "+obj[1].countSyllables(), 520, 150);
    text("# of words "+tWords.length, 520, 200);
    text("# of sentences "+sentences2.length, 520, 250);
    text("Flesch–Kincaid readability "+ (int)gradeLevel2, 520, 300);
    obj4[j].move();
    obj4[j].show();
    if (obj4[j].getX()>950) {
      j++;
    }
  }
  if (check[2]) {

    fill(0, 0, 100);
    rect(0, 500, 500, 500);
    fill(255);
    textSize(50);
    text("Paradise Lost ", 20, 600);
    textSize(30);
    text("# of syllables "+obj[2].countSyllables(), 20, 650);
    text("# of words "+pWords.length, 20, 700);
    text("# of sentences "+sentences3.length, 20, 750);
    text("Flesch–Kincaid readability "+ (int)gradeLevel3, 20, 800);
    obj5[j].move();
    obj5[j].show();
    if (obj5[j].getX()>950) {
      j++;
    }
  }
  if (check[3]) {

    fill(100, 100, 100);
    rect(500, 500, 500, 500);
    fill(255);
    textSize(50);
    text("Sam's Essay ", 520, 600);
    textSize(30);
    text("# of syllables "+obj[3].countSyllables(), 520, 650);
    text("# of words "+sWords.length, 520, 700);
    text("# of sentences "+sentences4.length, 550, 750);
    text("Flesch–Kincaid readability "+ (int)gradeLevel4, 520, 800);
    obj2[j].move();
    obj2[j].show();
    if (obj2[j].getX()>950) {
      j++;
    }
  }

  if (mouseX>500 && mouseY>500) {
    check[3]=true;
  } else {
    check[3]=false;
  }


  if (mouseX<500 && mouseY<500) {
    check[0]=true;
  } else {
    check[0]=false;
  }

  if (mouseX>500 && mouseY<500) {
    check[1]=true;
  } else {
    check[1]=false;
  }

  if (mouseX<500 && mouseY>500) {
    check[2]=true;
  } else {
    check[2]=false;
  }
}

void mousePressed() {
  j=0; 
  for (int i =0; i<sWords.length; i++) {
    obj2[i].setX();
  }
  for (int i =0; i<hWords.length; i++) {
    obj3[i].setX();
  }
  for (int i =0; i<tWords.length; i++) {
    obj4[i].setX();
  }
  for (int i =0; i<pWords.length; i++) {
    obj5[i].setX();
  }
}




import java.util.*;
public class StringParser {
  String[] hWords2;
  public StringParser(String[] ex) {
    hWords2 = new String[ex.length];
    for (int i =0; i<ex.length; i++) {
      hWords2[i]=ex[i];
    }
  }

  /**
   *countWords();
   * A "word" is defined as a contiguous string of alphabetic characters
   * i.e. any upper or lower case characters a-z or A-Z.  This method completely 
   * ignores numbers when you count words, and assumes that the document/paragraph does not have 
   * any strings that combine numbers and letters. 
   */


  public boolean isVowel(char c) {
    if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u'|| c=='y') {
      return true;
    } else {
      return false;
    }
  }



   boolean isVowel2(String c) {
    boolean check=false;
    for (int i=0; i<c.length(); i++) {
      if (c.charAt(i) == 'a' || c.charAt(i) == 'e' || c.charAt(i) == 'i' || c.charAt(i) == 'o' || c.charAt(i) == 'u'|| c.charAt(i)=='y') {
        check= true;
      }
    }
    return check;
  }

  public double countSyllables() {
    double count =0.0;
    for (int i =0; i<hWords2.length; i++) {
      count+=helper(hWords2[i]);
    }
    return count;
  }

  /**
   
   * Get the total number of syllables in the document (the paragraph). 
   * To count the number of syllables in a word, use the following rules:
   *       Each contiguous sequence of one or more vowels is a syllable, 
   *       with the following exception: a lone "e" at the end of a word 
   *       is not considered a syllable unless the word has no other syllables. 
   *       You should consider y a vowel.
   */

  public double helper(String word) {
    double count = 0.0;
    boolean check = false;
    for (int j = 0; j < word.length(); j++) {
      if (word.contains("a") || word.contains("e") || word.contains("i") || word.contains("o") || word.contains("u")||word.contains("y") ) {//checks to see if vowels are the the word
        if (isVowel(word.charAt(j)) && !((word.charAt(j) == 'e') && (j == word.length()-1))) {//exception for e at the end of the word
          if (check == false) {//previous vowel exception
            count++;
            check = true;
          }
        } else {//after the loop runs changes to false for previous vowel
          check = false;
        }
      } else {
        count++;
        break;
      }
    }


    return count;
  }

  /**
   * Eventually write this one too. Get the number of sentences in the document/paragraph.
   * Sentences are defined as contiguous strings of characters ending in an 
   * end of sentence punctuation (. ! or ?) or the last contiguous set of 
   * characters in the document, even if they don't end with a punctuation mark.
   */
}

public class moveText {
  int x1=0;
  int y=700;
  boolean check=true;
  String ex;
  public moveText(String s) {

    ex=s;
  }

  void move() {
    x1+=10;
    if (x1>1000) {
      x1=0;
    }
  }

  void show() {
    fill(200, 0, 0);
    textSize(50);
    text(ex, x1, y);
  }
  boolean getBool() {

    return check;
  }
  int getX() {

    return x1;
  }
  void setX() {
    x1=0;
  }
}
