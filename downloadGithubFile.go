package main

import (
	"encoding/base64"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
)

var (
	User       string
	Repo       string
	FilePath   string
	OutputPath string
	base       = "https://api.github.com/"
)

func main() {
	Setup()

	url := BuildUrl(base, User, Repo, FilePath)
	encoded := GetContent(url)
	content := Decode(encoded)

	WriteToFile(OutputPath, content)

	log.Printf("Downloaded the contents of %s to %s.", url, OutputPath)
}

func Setup() {
	flag.StringVar(&User, "user", "", "Github user")
	flag.StringVar(&Repo, "repo", "", "Github repo")
	flag.StringVar(&FilePath, "file", "", "Github file path")
	flag.StringVar(&OutputPath, "output", "", "Output file path")

	flag.Parse()

	if User == "" || Repo == "" || FilePath == "" || OutputPath == "" {
		flag.PrintDefaults()
		os.Exit(1)
	}
}

func BuildUrl(base string, User string, Repo string, FilePath string) string {
	return fmt.Sprintf("%s%s/%s/contents/%s", base, User, Repo, FilePath)
}

func GetContent(url string) string {
	resp, err := http.Get(url)
	defer resp.Body.Close()
	if err != nil {
		log.Printf("Could not GET %s (%s)", url, err)
		os.Exit(1)
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Printf("Could read request body (%s)", err)
		os.Exit(1)
	}

	return string(body)
}

func Decode(encoded string) string {
	encoded = `IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwppbXBvcnQgemxpYiwgYXJncGFyc2Us
ZGF0YSkK`
	data, err := base64.StdEncoding.DecodeString(encoded)
	if err != nil {
		log.Printf("Could not decode string (%s)\n", err)
		os.Exit(1)
	}

	return string(data)
}

func WriteToFile(outputFile string, content string) bool {
	f, err := os.Create(outputFile)
	defer f.Close()
	if err != nil {
		log.Printf("Could not create output file (%s)", err)
		os.Exit(1)
	}

	written, err := f.WriteString(content)
	if err != nil {
		log.Printf("Could write to output file (%s)", err)
		os.Exit(1)
	}

	return len(content) == written
}
