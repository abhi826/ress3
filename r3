#include <iostream>
#include <fstream>
#include <sstream>
using namespace std;

int main(int argc, char* argv[]) {
    int lines=0;
    int words=0;
    int chars=0;
    int digits=0;
    int letters=0;
    istream *in=&cin;
    ifstream file;
    if(argc>=2){
        file.open(argv[1]);
        if(file.is_open()){
            in=&file;
        }
        else{
            cerr<<"File could not be opened"<<endl;
            exit(1);
        }
    }
    string line;
    while(getline(*in,line)){
        lines++;
        chars+=(line.length());
        istringstream iss(line);
        string word;
        while(iss>>word){
            words++;
            for(int i=0;i<word.length();i++){
                if(isalpha(word[i])){
                    letters++;
                }
                if(isdigit(word[i])){
                    digits++;
                }
            }
        }
    }
    if(argc>=2){
        file.close();
    }
    if(lines==0){
        cout<<"File is empty."<<endl;
        return 0;
    }
    chars+=lines;
    cout<<"LINES: "<<lines<<endl;
    cout<<"WORDS: "<<words<<endl;
    cout<<"CHARS: "<<chars<<endl;
    cout<<"DIGITS: "<<digits<<endl;
    cout<<"LETTERS: "<<letters<<endl;


    return 0;
}
