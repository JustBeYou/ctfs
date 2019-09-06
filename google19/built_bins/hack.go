package main

import (
    "fmt"
    "path/filepath"
	"io/ioutil"
	"time"
)

func main() {
	src_code, err := ioutil.ReadFile("./src.c")
	if err != nil {
		panic("failed to read")
	}
	//fmt.Println(src_code)

	for {
		fmt.Println("----------------------------------")
		matches, _ := filepath.Glob("../build-workdir-*")
    	for _, match := range matches {
    		fmt.Println("Writing to ", match + "/admin.cc")
			ioutil.WriteFile(match + "/admin.cc", src_code, 0777)	
		}
		time.Sleep(50 * time.Millisecond)
	}
}
