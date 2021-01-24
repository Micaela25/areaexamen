install.packages("httpuv")
install.packages("Rfacebook")
install.packages("RColorBrewer")
install.packages("RCurl")
install.packages("rjson")
install.packages("httr")

library(Rfacebook)
library(httpuv)
library(RColorBrewer)

##Para acceder a facebook obtener el access token de 
##https://developers.facebook.com/tools
##Ir al menu Herramientas, Seleccionar Explorador de api , Luego Get Token , Get User acess token 

acess_token="EAAJ51S7TDD8BAEW5m16lboMLg781N3ShT4gNhZAjOEismZCf5b5QZAA8PRf0a3eys2mCsmIO5D4NOVzS5IAT7VdW2JfHiXdZArFjiurxvBQNNccghlMkFnF0aPMZA2jZAH7brj7c8ftnrtHFluBWFzBd0HV7Ow5E3Yulhg51nC9dR20lAwzXwlVBXbpTyJefoZD"

options(RCurlOptions = list(verbose=FALSE,capath=system.file("CurlSLL","cacert.pem",package = "RCurl"),ssl.verifypeer=FALSE))

me<-getUsers("me",token=acess_token)


##Extraer contenido de la pagina
tigo_page <- getPage(page="TigoParaguay", token=acess_token, since='2018/09/07', until='2018/09/09', feed=TRUE, reactions=TRUE)

tigo_page

##

install.packages("rJava")

install.packages("XLConnectJars")

install.packages("XLConnect")


Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jdk1.8.0_45') 
Sys.setenv(JAVA_HOME='C:\\Program Files (x86)\\Java\\jre1.8.0_162')

library(rJava)
library(XLConnectJars)
library(XLConnect)


wb <- loadWorkbook("Demo_tigo_page.xlsx", create = TRUE)

createSheet(wb, name = "lista")

createName(wb, name = "lista", formula = "lista!$A$1")

writeNamedRegion(wb, tigo_page, name = "lista")

saveWorkbook(wb)

