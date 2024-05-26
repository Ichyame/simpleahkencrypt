
# Simple AHK encryption

Very basic encryption for Text Files


## Usage/Examples

```autohotkey
#Include src\encryption.ahk

examplestring := "This text will be encrypted"
key := "I am a Key"

encryptedstring := csr.encrypt(examplestring, key) ;encrypt examplestring

FileAppend, % encryptedstring, * ;this just outputs our encypted string to Console
; Console:
; S$Ludx3XoGv%Ondf3kZ3bHbrMi2

decryptedstring := csr.decrypt(encryptedstring, key) ;decrypt decryptedstring

FileAppend, % decryptedstring, *

; Console:
; This text will be encrypted
```

