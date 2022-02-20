package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"os/exec"
	"strings"

	"github.com/pkg/errors"
)

func confirm(msg string) {
	fmt.Printf("%s [Y/N]? ", msg)
	r := bufio.NewReader(os.Stdin)
	t, err := r.ReadString('\n')
	if err != nil {
		log.Fatal(errors.WithStack(err))
	}
	if strings.TrimSpace(t) != "y" {
		log.Fatal("Cancelling.")
	}
}

func symlink(target, name string) error {
	exists, err := fileExists(target)
	if err != nil {
		return err
	}
	if !exists {
		return errors.Errorf("%s doesn't exist", target)
	}

	if _, err := runCmd("ln", "-s", target, name); err != nil {
		return err
	}
	return nil
}

func fileExists(name string) (bool, error) {
	if _, err := os.Stat(name); err == nil {
		return true, nil
	} else if os.IsNotExist(err) {
		return false, nil
	} else {
		return false, errors.WithStack(err)
	}
}

func runCmd(cmd string, args ...string) (string, error) {
	res := exec.Command(cmd, args...)
	stdout, err := res.Output()
	if err != nil {
		return "", errors.Wrapf(err, "failed to run command %s %v %s", cmd, args, stdout)
	}
	return string(stdout), nil
}
