Attribute VB_Name = "Module1"
Sub Get_Web_Data()

Dim request As Object
Dim response As String
Dim html As New HTMLDocument
Dim website As String
Dim price As Variant


'Website to go to.
website = "https://finance.yahoo.com/quote/EURUSD%3DX?p=EURUSD%3DX"

' Create the object that will make the webpage request.
Set request = CreateObject("MSXML2.XMLHTTP")

' Where to go and how to go there .
request.Open "GET", website, False

'Get fresh data.
request.setRequestHeader "If-Modified-Since", "Sat, 1 Jan 2000 00:00:00 GMT"

' Send the request for the webpage.
request.send

' Get the webpage response data into a variable.
response = StrConv(request.responseBody, vbUnicode)

' Put the webpage into an html object to make data references easier.
html.body.innerHTML = response

' Get the price from the specified element on the page.
price = html.getElementsByClassName("Trsdu(0.3s) Fw(b) Fz(36px) Mb(-4px) D(ib)")(0).innerText

' Output the price into a message box.
MsgBox price


End Sub
