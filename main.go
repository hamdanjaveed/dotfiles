package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"

	"github.com/pkg/errors"
)

func main() {
	// cmd := exec.Command("ln", "-s", "./files/bash_profile", "./bash_profile")
	// if _, err := cmd.Output(); err != nil {
	// 	panic(err)
	// }

	if err := run(); err != nil {
		log.Fatal(err)
	}
	fmt.Println("Done!")
}

func run() error {
	if err := symlinkFiles(); err != nil {
		return err
	}
	return nil
}

func symlinkFiles() error {
	path, err := os.Getwd()
	if err != nil {
		return errors.WithStack(err)
	}
	items, err := os.ReadDir("files")
	if err != nil {
		return errors.WithStack(err)
	}

	for _, i := range items {
		if i.IsDir() {
			return errors.New("Don't know how to deal with dirs in files yet.")
		}
		n := filepath.Join(path, "files", i.Name())
		confirm(fmt.Sprintf("Create symlink for %s", n))
		if err := symlink(n, dotFileName(i.Name())); err != nil {
			return err
		}
	}
	return nil
}

func dotFileName(name string) string {
	// TODO: use absolute path
	return fmt.Sprintf("~/.%s", name)
}
