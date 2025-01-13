---
order: -1
---

PDF forms differ from standard PDF files in form metadata. It determines which editor opens a file: the form editor or the standard PDF editor.

To distinguish standard PDF files from PDF forms, you can use the check functions. These functions take the first 300 bytes of the file and check if there is `"ONLYOFFICEFORM"` there. If `true`, then it is an extended PDF file. Otherwise, it is a standard PDF file.

Below you can find the check functions in different programming languages. 

## JavaScript

```ts
function isExtendedPDFFile(text) {
  if (!text) {
    return false
  }
  const indexFirst = text.indexOf("%\u00CD\u00CA\u00D2\u00A9\u000D")
  if (indexFirst === -1) {
    return false
  }
  let pFirst = text.slice(indexFirst + 6)
  if (!(pFirst.lastIndexOf("1 0 obj\u000A<<\u000A", 0) === 0)) {
    return false
  }
  pFirst = pFirst.slice(11)
  const signature = "ONLYOFFICEFORM"
  const indexStream = pFirst.indexOf("stream\u000D\u000A")
  const indexMeta = pFirst.indexOf(signature)
  if (indexStream === -1 || indexMeta === -1 || indexStream < indexMeta) {
    return false
  }
  let pMeta = pFirst.slice(indexMeta)
  pMeta = pMeta.slice(signature.length + 3)
  let indexMetaLast = pMeta.indexOf(" ")
  if (indexMetaLast === -1) {
    return false
  }
  pMeta = pMeta.slice(indexMetaLast + 1)
  indexMetaLast = pMeta.indexOf(" ")
  if (indexMetaLast === -1) {
    return false
  }
  return true
}
```

## Node.js

```ts
DocManager.prototype.isExtendedPDFFile = function isExtendedPDFFile(fileName) {
  let filePath = this.forcesavePath(fileName, null, false)
  if (filePath === "") {
    filePath = this.storagePath(fileName)
  }
  const bufferSize = 300
  const buffer = Buffer.alloc(bufferSize)
  const fd = fileSystem.openSync(filePath, "r")
  fileSystem.readSync(fd, buffer, 0, bufferSize)
  fileSystem.closeSync(fd)
  const pBuffer = buffer.toString("latin1")
  const indexFirst = pBuffer.indexOf("%\u00CD\u00CA\u00D2\u00A9\u000D")
  if (indexFirst === -1) {
    return false
  }
  let pFirst = pBuffer.slice(indexFirst + 6)
  if (!pFirst.startsWith("1 0 obj\u000A<<\u000A")) {
    return false
  }
  pFirst = pFirst.slice(11)
  const indexStream = pFirst.indexOf("stream\u000D\u000A")
  const indexMeta = pFirst.indexOf(configServer.get("gFormatOformPdfMetaTag"))
  if (indexStream === -1 || indexMeta === -1 || indexStream < indexMeta) {
    return false
  }
  let pMeta = pFirst.slice(indexMeta)
  pMeta = pMeta.slice(configServer.get("gFormatOformPdfMetaTag").length + 3)
  let indexMetaLast = pMeta.indexOf(" ")
  if (indexMetaLast === -1) {
    return false
  }
  pMeta = pMeta.slice(indexMetaLast + 1)
  indexMetaLast = pMeta.indexOf(" ")
  if (indexMetaLast === -1) {
    return false
  }
  return true
}
```

## Java Spring

```java
@SneakyThrows
public Boolean isExtendedPDFFile(final String fileName) {
  Resource resource = storageMutator.loadFileAsResource(fileName);
  byte[] bytes;
  try (InputStream inputStream = resource.getInputStream()) {
    bytes = inputStream.readNBytes(110);
  } catch (Exception e) {
    return false;
  }
  String pBuffer = new String(bytes, "Windows-1252");
  int indexFirst = pBuffer.indexOf("%\315\312\322\251\015");
  if (indexFirst == -1) {
    return false;
  }
  String pFirst = pBuffer.substring(indexFirst + 6);
  if (!pFirst.startsWith("1 0 obj\012<<\012")) {
    return false;
  }
  pFirst = pFirst.substring(11);
  int indexStream = pFirst.indexOf("stream\015\012");
  int indexMeta = pFirst.indexOf(Constants.G_FORMAT_OFORM_PDF_META_TAG);
  if (indexStream == -1 || indexMeta == -1 || indexStream < indexMeta) {
    return false;
  }
  String pMeta = pFirst.substring(indexMeta);
  pMeta = pMeta.substring(Constants.G_FORMAT_OFORM_PDF_META_TAG.length() + 3);
  int indexMetaLast = pMeta.indexOf(" ");
  if (indexMetaLast == -1) {
    return false;
  }
  pMeta = pMeta.substring(indexMetaLast + 1);
  indexMetaLast = pMeta.indexOf(" ");
  if (indexMetaLast == -1) {
    return false;
  }
  return true;
}
```

## C++

```cpp
bool COfficeFileFormatChecker::isPdfOformFormatFile(unsigned char *pBuffer, int dwBytes)
{
  pBuffer[dwBytes - 1] = 0;
  char* pFirst = strstr((char*)pBuffer, "%\315\312\322\251\015");
  if (!pFirst || pFirst - (char*)pBuffer + 6 >= dwBytes)
    return false;
  pFirst += 6;
  if (strncmp(pFirst, "1 0 obj\012<<\012", 11) != 0 || pFirst - (char*)pBuffer + 11 >= dwBytes)
    return false;
  pFirst += 11;
  char* pStream = strstr(pFirst, "stream\015\012");
  char* pMeta = strstr(pFirst, g_format_oform_pdf_meta_tag);
  if (!pStream || !pMeta || pStream < pMeta)
    return false;
  pMeta += strlen(g_format_oform_pdf_meta_tag) + 3;
  char* pMetaLast = strstr(pMeta, " ");
  if (!pMetaLast)
    return false;
  pMeta = pMetaLast + 1;
  pMetaLast = strstr(pMeta, " ");
  if (!pMetaLast)
    return false;
  return true;
}
```

## Python

```py
def is_pdf_form(text):
  if not text:
    return False

  index_first = text.find(b"%\xCD\xCA\xD2\xA9\x0D")
  if index_first == -1:
    return False

  p_first = text[index_first + 6:]
  if not p_first.startswith(b"1 0 obj\x0A<<\x0A"):
    return False

  p_first = p_first[11:]
  signature = b"ONLYOFFICEFORM"
  index_stream = p_first.find(b"stream\x0D\x0A")
  index_meta = p_first.find(signature)
  if index_stream == -1 or index_meta == -1 or index_stream < index_meta:
    return False

  p_meta = p_first[index_meta:]
  p_meta = p_meta[len(signature) + 3:]
  index_meta_last = p_meta.find(b" ")
  if index_meta_last == -1:
    return False

  p_meta = p_meta[index_meta_last + 1:]
  index_meta_last = p_meta.find(b" ")
  if index_meta_last == -1:
    return False

  return True
```

## PHP

```php
<?php

public function isOnlyofficeForm($file) {
  if ($file === null) return false;

  $limitDetect = 300;
  $onlyofficeFormMetaTag = "ONLYOFFICEFORM";
  $path = $file->getStoredFilePath() . "file";
  $content = file_get_contents($path, false, null, 0, $limitDetect);
  $indexFirst = strpos($content, "%\xCD\xCA\xD2\xA9\x0D");
  if ($indexFirst === false) {
    return false;
  }
  $pFirst = substr($content, $indexFirst + 6);
  if (!str_starts_with($pFirst, "1 0 obj\n<<\n")) {
    return false;
  }
  $pFirst = substr($pFirst, 11);
  $indexStream = strpos($pFirst, "stream\x0D\x0A");
  $indexMeta = strpos($pFirst, $onlyofficeFormMetaTag);
  if ($indexStream === false || $indexMeta === false || $indexStream < $indexMeta) {
    return false;
  }
  $pMeta = substr($pFirst, $indexMeta);
  $pMeta = substr($pMeta, strlen($onlyofficeFormMetaTag) + 3);
  $indexMetaLast = strpos($pMeta, " ");
  if ($indexMetaLast === false) {
    return false;
  }
  $pMeta = substr($pMeta, $indexMetaLast + 1);
  $indexMetaLast = strpos($pMeta, " ");
  if ($indexMetaLast === false) {
    return false;
  }
  return true;
}

?>
```
