
# Simple AHK encryption

Very basic encryption for Text Files


## Usage/Examples

### for AutoHotkey Version 1.1
```autohotkey
#Include src\encryption.ahk ;include the downloaded ahk file

examplestring := "This text will be encrypted"
key := "I am a Key"

encryptedstring := csr.encrypt(examplestring, key) ;encrypt examplestring

FileAppend, % encryptedstring, * ;this just outputs our encypted string to Console
; Console:
; lQe.w%Cq8Z,Rh7wyC4sCuau f2B

decryptedstring := csr.decrypt(encryptedstring, key) ;decrypt decryptedstring

FileAppend, % decryptedstring, *

; Console:
; This text will be encrypted
```

### for AutoHotkey Version 2
```autohotkey
#Include src\encryptionV2.ahk ;include the downloaded ahk file

examplestring := "This text will be encrypted"
key := "I am a Key"

encryptedstring := csr().encrypt(examplestring, key) ;encrypt examplestring

FileAppend encryptedstring, "*" ;this outputs our encypted string to Console

; Console:
; lQe.w%Cq8Z,Rh7wyC4sCuau f2B

decryptedstring := csr().decrypt(encryptedstring, key) ;decrypt decryptedstring

FileAppend decryptedstring, "*"

; Console:
; This text will be encrypted
```

