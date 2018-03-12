package main

import (
	"database/sql"
	"fmt"
)

type race struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
	Location  string    `json:"location"`
	CloseTime string `json:"close_time"`
}

func (r *race) getRace(db *sql.DB) error {
	statement := fmt.Sprintf("SELECT r.id, rt.name, m.location, r.close_time " +
		"FROM  races r " +
		"INNER JOIN meeting m ON m.id = r.meeting_id " +
		"INNER JOIN race_type rt ON rt.id = m.race_type_id " +
		"WHERE r.id=%d " +
		"LIMIT 5", r.ID)
	return db.QueryRow(statement).Scan(&r.ID, &r.Name, &r.Location, &r.CloseTime)
}

func getRaces(db *sql.DB) ([]race, error) {
	statement := fmt.Sprintf("SELECT r.id, rt.name, m.location, r.close_time " +
		"FROM  races r " +
		"INNER JOIN meeting m ON m.id = r.meeting_id " +
		"INNER JOIN race_type rt ON rt.id = m.race_type_id " +
		"WHERE close_time >= NOW() " +
		"ORDER BY close_time " +
		"LIMIT 5")
	rows, err := db.Query(statement)

	if err != nil {
		return nil, err
	}

	defer rows.Close()

	races := []race{}

	for rows.Next() {
		var r race
		if err := rows.Scan(&r.ID, &r.Name, &r.Location, &r.CloseTime); err != nil {
			return nil, err
		}
		races = append(races, r)
	}

	return races, nil
}