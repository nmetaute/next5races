package main

func main() {
	a := App{}
	a.Initialize("root", "mysql", "races")
	a.Run(":8443")
}
