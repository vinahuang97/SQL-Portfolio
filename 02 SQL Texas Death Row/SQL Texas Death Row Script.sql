-- crime scene report
SELECT *
FROM crime_scene_report
WHERE type = 'murder'
  AND date = 20180115
  AND city = 'SQL City';

-- first witness
SELECT id AS person_id, name, address_number, address_street_name, i.transcript
FROM person p
join interview i
	on p.id = i.person_id
WHERE name like 'Annabel%' 
  AND address_street_name = 'Franklin Ave';

-- second witness
SELECT id AS person_id, name, address_number, address_street_name, i.transcript
FROM person p
join interview i
	on p.id = i.person_id
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
Limit 1;

-- The Murderer
SELECT p.id AS person_id, p.name, g.membership_id, m.membership_status, g.check_in_date, d.plate_number, d.car_make, d.car_model
FROM get_fit_now_member m
JOIN person p ON m.person_id = p.id
JOIN get_fit_now_check_in g ON m.id = g.membership_id
JOIN drivers_license d ON p.license_id = d.id
WHERE g.membership_id LIKE '48Z%'                    -- Membership ID starts with "48Z"
  AND m.membership_status = 'gold'                    -- Only gold members have these bags
  AND g.check_in_date = 20180109                      -- Witness saw the killer at the gym on Jan 9, 2018
  AND d.plate_number LIKE '%H42W%';                   -- The car plate includes "H42W"

-- Murderer Transcript
SELECT transcript
FROM interview
WHERE person_id = '67318';


-- real_villain
SELECT p.name, dl.id, height, hair_color, gender, car_model, i.annual_income, f.event_name,
	count(f.event_name) as total_event_attandance
FROM drivers_license dl
join person p
	on p.license_id = dl.id
join income i
	on p.ssn = i.ssn
join facebook_event_checkin f
	on f.person_id = p.id
where gender = 'female' and hair_color = 'red' and 
	car_model = "Model S" and (height between 65 and 67)
	and f.event_name like '%SQL%';


