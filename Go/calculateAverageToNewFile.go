package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func readFileLineByLine(pathOfFile string) []string {
	var file *os.File
	var err error
	file, err = os.Open(pathOfFile)

	// if error occurs while opening the file
	if err != nil {
		log.Fatalln("Cannot open the file at %s.\nError: ", pathOfFile, err)
	}

	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)
	var lines []string
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	file.Close()

	return lines
}

func calculateAverageFromLine(line string) float64 {
	numbersInLine := strings.Split(line, "	")
	total := 0
	for i := 0; i < len(numbersInLine); i++ {
		number, err := strconv.Atoi(numbersInLine[i])
		if err != nil {
			log.Fatalln("Cannot parse the string (%s) into int.\nError: %s", numbersInLine[i], err)
		}
		total += number
	}
	return float64(total) / float64(len(numbersInLine))
}

func createNewFile(pathOfNewFile string) *os.File {
	newFile, err := os.Create(pathOfNewFile)
	if err != nil {
		log.Fatalln("Cannot create the file at %s.\nError: %s", pathOfNewFile, err)
	}
	return newFile
}

func insertAverageToFile(fileToInsert *os.File, average float64) {
	stringFormOfAverage := fmt.Sprintf("%f", average) + "\n"

	_, err := fileToInsert.WriteString(stringFormOfAverage)
	if err != nil {
		log.Fatalln("Cannot write to the file at %s the information %f.\nError: %s", fileToInsert.Name(), average, err)
	}
}

func main() {
	lines := readFileLineByLine("numbers.txt")
	if len(lines) > 0 {
		newFile := createNewFile("average.txt")
		for i := 0; i < len(lines); i++ {
			insertAverageToFile(newFile, calculateAverageFromLine(lines[i]))
		}
		newFile.Close()
	}
}