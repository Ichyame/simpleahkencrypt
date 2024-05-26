
# Simple AHK encryption

Very basic encryption for Text Files


## Usage/Examples

```autohotkey
#Include src\encryption.ahk

examplestring := "This text will be encrypted"
key := "I am a Key"

encryptedstring := csr.encrypt(examplestring, A_ComputerName) ;encrypt examplestring

FileAppend, % encryptedstring, * ;this just outputs our encypted string to Console
; Console:
; tCEKXPJaKoDDHDX$Jn.R3MUHGAI

decryptedstring := csr.decrypt(encryptedstring, A_ComputerName) ;decrypt decryptedstring

FileAppend, % decryptedstring, *

; Console:
; This text will be encrypted
```

