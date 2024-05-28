
class csr {
    ;A static array containing all the characters used for encryption/decryption
    static char := ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0"," ","""",":",".",",","$","%","&","?","=","/","\","`n","#","<",">","(",")",";","{","}","+","-"]
    encrypt(string,key) {
        StringCaseSense, On ;Make the string operations case-sensitive
        transformedkey := this.keygen(key) ;Generate the transformed key
        output := "" ;Initialize an empty output string
        stringarr := StrSplit(string) ;Convert the input string into an array

        ;Encrypt each character of the input string
        for index in stringarr {
            Loop % this.char.Length() {
                If (stringarr[index] == this.char[A_Index]) {
                    stringarr[index] := this.char[this.overflowprotect(A_Index + transformedkey[Mod(index,transformedkey.Length())+1],this.char.Length())] 
                    Break
                }   
            }
            output .= stringarr[A_Index] ;Append the encrypted character to the output string

        }
    return output ;Return the encrypted string
    }

    ;Similar to the encrypt method, but performs the reverse operation
    decrypt(string,key) { 
        StringCaseSense, On
        transformedkey := this.keygen(key)
        output := ""
        stringarr := StrSplit(string)

        for index in stringarr {
            Loop % this.char.Length() {
                If (stringarr[index] == this.char[A_Index]) {        
                    stringarr[index] := this.char[this.underflowprotect(A_Index - transformedkey[Mod(index,transformedkey.Length())+1],this.char.Length())]
                    Break
                }   
            }
            output .= stringarr[A_Index]
        }
        return output
    }

    ;Helper function to handle index overflow
    overflowprotect(target, size) {     
        while (target > size)
            target -= size
        return target
    }

    ;Helper function to handle index underflow
    underflowprotect(target, size) {     
        while (target < 1)
            target += size
        return target
    }

    keygen(key){
        transformedkey := []

        ;Convert the key into an array of the indices of each character
        Loop % StrLen(key) {
            keyit := SubStr(key, A_Index, 1)
            keypos := A_Index
            Loop % this.char.Length() {
                If (keyit == this.char[A_Index]) {
                    transformedkey.Push(A_Index) 
                    Break
                }   
            }    
        }
        ;Calculate the average of the transformed key indices
        sum := 0
        Loop % transformedkey.Length() {
            sum := sum + transformedkey[A_Index]
        }
        avg := Floor(sum/transformedkey.Length())

        ;Modify the transformed key indices based on the average and position
        Loop % transformedkey.Length() {
            transformedkey[A_Index] := this.overflowprotect(avg + transformedkey[A_Index] + A_Index, this.char.Length())
        }
        return transformedkey
    }
}

