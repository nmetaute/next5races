package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"
)

var a App

func TestMain(m *testing.M) {
	a = App{}
	a.Initialize("root", "mysql", "races")
	code := m.Run()
	os.Exit(code)
}

func TestEmptyTable(t *testing.T) {
	req, _ := http.NewRequest("GET", "/races", nil)
	response := executeRequest(req)
	checkResponseCode(t, http.StatusOK, response.Code)
	if body := response.Body.String(); body == "[]" {
		t.Errorf("Expected %s. Got an empty array", body)
	}
}

func TestGetNonExistentRace(t *testing.T) {
	req, _ := http.NewRequest("GET", "/race/101", nil)
	response := executeRequest(req)
	checkResponseCode(t, http.StatusNotFound, response.Code)
	var m map[string]string
	json.Unmarshal(response.Body.Bytes(), &m)
	if m["error"] != "Race not found" {
		t.Errorf("Expected the 'error' key of the response to be set to 'Race not found'. Got '%s'", m["error"])
	}
}

func TestGetRace(t *testing.T) {
	req, _ := http.NewRequest("GET", "/race/1", nil)
	response := executeRequest(req)
	checkResponseCode(t, http.StatusOK, response.Code)
}

func executeRequest(req *http.Request) *httptest.ResponseRecorder {
	rr := httptest.NewRecorder()
	a.Router.ServeHTTP(rr, req)

	return rr
}
func checkResponseCode(t *testing.T, expected, actual int) {
	if expected != actual {
		t.Errorf("Expected response code %d. Got %d\n", expected, actual)
	}
}
