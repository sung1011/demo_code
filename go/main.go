package main

import "fmt"

func main() {
	jobs := make(chan int, 100)
	done := make(chan int, 100)
	for id := 1; id <= 3; id++ {
		go worker(id, jobs, done)
	}
	for i := 1; i <= 10; i++ {
		jobs <- i
	}
	close(jobs)
	for i := 1; i <= 10; i++ {
		<-done
	}

}

func worker(id int, jobs <-chan int, done chan<- int) {
	for j := range jobs {
		fmt.Printf("worker: %d, job: %d \n", id, j)
		done <- 1
	}
}
