package main

import (
	"fmt"
)

var (
	GitCommit string
	GitTag    string
)

func main() {
	fmt.Println("Commit:", GitCommit)
	fmt.Println("Tag:", GitTag)
}
