--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


-- Data for Name: et_action_taken; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_action_taken (id, title, description) VALUES (1, 'Allowed', 'Allowed to Enter');
INSERT INTO public.et_action_taken (id, title, description) VALUES (2, 'Screen', 'Screen Traveller');
INSERT INTO public.et_action_taken (id, title, description) VALUES (3, 'Denied', 'Denied Entry');
INSERT INTO public.et_action_taken (id, title, description) VALUES (4, 'Conditional', 'Conditionally Allowed');
INSERT INTO public.et_action_taken (id, title, description) VALUES (0, 'New', 'New entry');


--
-- Data for Name: et_diseases; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_diseases (id, title) VALUES (1, 'cholera');
INSERT INTO public.et_diseases (id, title) VALUES (2, 'covid');


--
-- Data for Name: et_symptoms; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_symptoms (id, title, title_sw, alias) VALUES (1, 'Fever', NULL, 'Fever');
INSERT INTO public.et_symptoms (id, title, title_sw, alias) VALUES (2, 'Swollen glands', NULL, 'Swollen glands');
INSERT INTO public.et_symptoms (id, title, title_sw, alias) VALUES (3, 'Skin rash', NULL, 'Skin rash');
INSERT INTO public.et_symptoms (id, title, title_sw, alias) VALUES (4, 'Vomiting', NULL, 'Vomiting');
INSERT INTO public.et_symptoms (id, title, title_sw, alias) VALUES (5, 'Jaundice', NULL, 'Jaundice');
INSERT INTO public.et_symptoms (id, title, title_sw, alias) VALUES (6, 'Headache', NULL, 'Headache');


--
-- Data for Name: et_disease_symptoms; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: et_locations; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_locations (id, title, code, parent, calling_code) VALUES (1, 'Tanzania', 'TZ', 0, NULL);
INSERT INTO public.et_locations (id, title, code, parent, calling_code) VALUES (2, 'Kenya', 'KE', 0, NULL);
INSERT INTO public.et_locations (id, title, code, parent, calling_code) VALUES (3, 'Uganda', 'UG', 0, NULL);
INSERT INTO public.et_locations (id, title, code, parent, calling_code) VALUES (4, 'Rwanda', 'RW', 0, NULL);
INSERT INTO public.et_locations (id, title, code, parent, calling_code) VALUES (0, 'None', 'None', 0, NULL);


--
-- Data for Name: et_location_diseases; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: et_modules; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_modules (id, title, icon, link) VALUES (1, 'Screening', 'fa-temperature-high', 'screen');
INSERT INTO public.et_modules (id, title, icon, link) VALUES (3, 'Dashboard', 'fa-chart-line', 'dashboard');
INSERT INTO public.et_modules (id, title, icon, link) VALUES (2, 'Secondary Screening', 'fa-virus', 'sec_screen');
INSERT INTO public.et_modules (id, title, icon, link) VALUES (5, 'Report', 'fa-report', 'show_report');


--
-- Data for Name: et_point_of_entries; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_point_of_entries (id, title, code, mode_of_transport, category) VALUES (1, 'JNIA', 'JNIA', 'flight', 'Airport');
INSERT INTO public.et_point_of_entries (id, title, code, mode_of_transport, category) VALUES (2, 'MIA', 'MIA', 'flight', 'Airport');
INSERT INTO public.et_point_of_entries (id, title, code, mode_of_transport, category) VALUES (3, 'KIA', 'KIA', 'flight', 'Airport');
INSERT INTO public.et_point_of_entries (id, title, code, mode_of_transport, category) VALUES (4, 'Holili', 'HOL', 'vehicle', 'Ground crossing');
INSERT INTO public.et_point_of_entries (id, title, code, mode_of_transport, category) VALUES (5, 'Manyovu', 'MYV', 'vehicle', 'Ground crossing');
INSERT INTO public.et_point_of_entries (id, title, code, mode_of_transport, category) VALUES (0, 'ALL', 'ALL', 'train', 'Railway');


--
-- Data for Name: et_point_of_entries_agents; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: et_reports; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_reports (id, title, description, query) VALUES (1, 'Screened Travellers', 'Number of screened travellers', 'query');
INSERT INTO public.et_reports (id, title, description, query) VALUES (2, 'count travellers', 'Counting t travellers', 'select * from et_travellers');


--
-- Data for Name: et_screen_criteria; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: et_ss_criteria; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_ss_criteria (id, temp, active, disease_id) VALUES (7, NULL, '0', 1);
INSERT INTO public.et_ss_criteria (id, temp, active, disease_id) VALUES (8, NULL, '0', 1);
INSERT INTO public.et_ss_criteria (id, temp, active, disease_id) VALUES (9, NULL, '0', 1);
INSERT INTO public.et_ss_criteria (id, temp, active, disease_id) VALUES (6, NULL, '0', 1);
INSERT INTO public.et_ss_criteria (id, temp, active, disease_id) VALUES (2, '35.3', '1', 2);


--
-- Data for Name: et_ss_criteria_countries; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_ss_criteria_countries (id, screencriteria_id, location_id) VALUES (20, 7, 4);
INSERT INTO public.et_ss_criteria_countries (id, screencriteria_id, location_id) VALUES (21, 8, 4);
INSERT INTO public.et_ss_criteria_countries (id, screencriteria_id, location_id) VALUES (22, 9, 4);
INSERT INTO public.et_ss_criteria_countries (id, screencriteria_id, location_id) VALUES (23, 6, 4);
INSERT INTO public.et_ss_criteria_countries (id, screencriteria_id, location_id) VALUES (31, 2, 2);


--
-- Data for Name: et_ss_criteria_symptoms; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (9, 7, 1);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (10, 7, 2);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (11, 9, 1);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (12, 9, 2);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (16, 2, 6);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (17, 2, 1);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (18, 2, 2);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (19, 2, 3);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (20, 2, 4);
INSERT INTO public.et_ss_criteria_symptoms (id, screencriteria_id, symptom_id) VALUES (21, 2, 5);


--
-- Data for Name: et_travellers; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', '93ef1948-3ed6-11eb-9de3-2af8bc65b5d8', 'Mariah Cummings', NULL, 'none', 'male', NULL, 4, 'national-id', '549-66-6008', 'non-government', '', 'vehicle', 'dwfPExYCjwLjqGSMYoRu', '57', '2020-12-15', 'resident', '', 3, '5610 Mckee Glen
Davisstad, DC 63164', 'Unit 3507 Box 1585
DPO AA 32338', '8818800280648', 'zdavis@stephens-harrell.net', 38.12, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55aa7e4-3ed6-11eb-81b0-2af8bc65b5d8', 'Mariah Cummings', NULL, 'none', 'male', NULL, 4, 'national-id', '549-66-6008', 'non-government', '', 'vehicle', 'dwfPExYCjwLjqGSMYoRu', '57', '2020-12-15', 'resident', '', 3, '5610 Mckee Glen
Davisstad, DC 63164', 'Unit 3507 Box 1585
DPO AA 32338', '8818800280648', 'zdavis@stephens-harrell.net', 38.12, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55cb21e-3ed6-11eb-81b0-2af8bc65b5d8', 'Levi Edwards', NULL, 'none', 'female', NULL, 28, 'passport-number', '505-44-8232', 'religious', '', 'vessel', 'gMIpyenLwkxKIzTThUcb', '17', '2020-12-15', 'transit', '', 3, '3361 Schroeder Flat
Devinborough, AL 54880', '348 Casey Brooks Suite 107
Turnermouth, MT 27415', '4899140599336', 'charlotte99@hotmail.com', 34.54, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55cc830-3ed6-11eb-81b0-2af8bc65b5d8', 'Michelle Burch', NULL, 'none', 'female', NULL, 10, 'national-id', '202-91-9232', 'student', '', 'flight', 'eRiTFVauxzqUbXytGZig', '49', '2020-12-15', 'resident', '', 3, '709 Elizabeth Crest Apt. 394
Singletonfurt, MD 66055', 'USS Ford
FPO AE 39835', '3318549717144', 'zdavis@anderson.biz', 34.91, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ce0ae-3ed6-11eb-81b0-2af8bc65b5d8', 'Carolyn Mcclain', NULL, 'none', 'female', NULL, 77, 'national-id', '302-29-6559', 'student', '', 'vessel', 'KKezIBqrOjOlnCMFpDuv', '18', '2020-12-15', 'transit', '', 3, '659 Stephanie Crossroad Suite 634
Dukeville, MT 53080', 'USNV Leonard
FPO AP 59438', '1356772635233', 'alvarezmichael@hotmail.com', 40.97, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55cf85a-3ed6-11eb-81b0-2af8bc65b5d8', 'Tammy Murphy', NULL, 'none', 'male', NULL, 29, 'passport-number', '640-41-9502', 'non-government', '', 'flight', 'YHEeEcwleCTYOETDmdyY', '21', '2020-12-15', 'tourist', '', 3, '6057 Kathleen Forks
North Susan, VA 71850', '9797 Christopher Valley
Sarahside, WV 10685', '4163221350710', 'kedwards@strong.com', 35.3, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d0cbe-3ed6-11eb-81b0-2af8bc65b5d8', 'Gabriella Simmons', NULL, 'none', 'female', NULL, 20, 'national-id', '493-65-8537', 'non-government', '', 'flight', 'oIGRIovdntKuNthqpmkP', '72', '2020-12-15', 'resident', '', 3, '7371 Orozco Fork
North Bradley, WI 86768', '38300 Meghan Ferry
Maldonadoton, DC 51287', '5681693882049', 'watsonerika@bowman-anderson.com', 35.89, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d2082-3ed6-11eb-81b0-2af8bc65b5d8', 'Jonathon Fowler', NULL, 'none', 'male', NULL, 27, 'passport-number', '176-05-2469', 'non-government', '', 'flight', 'jNDJIuBKBTeUGKfrXwwm', '8', '2020-12-15', 'transit', '', 3, 'USNS Andrews
FPO AE 12650', '5855 Jennifer Hollow Apt. 882
Smithmouth, KY 01846', '0846282070888', 'nicholsontonya@lopez.biz', 35.25, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d2eec-3ed6-11eb-81b0-2af8bc65b5d8', 'Rachel Reynolds', NULL, 'none', 'male', NULL, 42, 'national-id', '619-56-6282', 'non-profit', '', 'flight', 'EZLMiCuIrvhCwvPtUzzW', '8', '2020-12-15', 'business', '', 3, '1654 Alvarado Stravenue Suite 098
Haasport, AR 95464', '97062 Duke Locks
Port Paulaland, OH 89328', '8091053686016', 'richstephanie@gmail.com', 35.03, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d41a2-3ed6-11eb-81b0-2af8bc65b5d8', 'Brian Boyer', NULL, 'none', 'male', NULL, 41, 'passport-number', '138-93-6085', 'religious', '', 'vehicle', 'EvvMlkLYblIatOnXWFDP', '15', '2020-12-15', 'transit', '', 3, '743 Hernandez Greens Apt. 786
Tylerside, MI 66954', '530 Lisa Hollow
New Ryantown, IA 33513', '2821335695949', 'lhenson@hardy.info', 35.06, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d5228-3ed6-11eb-81b0-2af8bc65b5d8', 'Eric Yu', NULL, 'none', 'female', NULL, 16, 'national-id', '182-71-6594', 'non-profit', '', 'vessel', 'CoitIGVxRHRDVKBwaiRb', '22', '2020-12-15', 'tourist', '', 3, '4542 Dennis Plain Suite 561
Byrdhaven, WI 76428', '537 Jones Summit
South Patrickfort, AK 56848', '4850115995514', 'regina23@hotmail.com', 40.19, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d6290-3ed6-11eb-81b0-2af8bc65b5d8', 'Nicole Stevens', NULL, 'none', 'male', NULL, 59, 'passport-number', '554-77-2649', 'business', '', 'flight', 'EXaVAXXPBASpUVDGJlKb', '85', '2020-12-15', 'tourist', '', 3, 'Unit 3616 Box 0741
DPO AA 19205', '2922 John Walks Apt. 610
East Michelle, UT 17336', '0533347016441', 'pamela92@gmail.com', 39.51, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d6f7e-3ed6-11eb-81b0-2af8bc65b5d8', 'Anthony Anderson', NULL, 'none', 'male', NULL, 77, 'passport-number', '158-83-9701', 'student', '', 'vehicle', 'hBNVqNeoJofMSCvAUPsE', '70', '2020-12-15', 'business', '', 3, 'USNV Blevins
FPO AE 70316', '6824 Mason Burg Apt. 837
Bennettshire, FL 25827', '4822091082082', 'gbright@hotmail.com', 36.9, '2, 1', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d7bd6-3ed6-11eb-81b0-2af8bc65b5d8', 'Sierra Davis', NULL, 'none', 'male', NULL, 35, 'national-id', '421-70-4143', 'student', '', 'vessel', 'AFjNJvsyLFptqNfpyCPE', '69', '2020-12-15', 'transit', '', 3, 'USNV White
FPO AE 90944', '233 Wallace Rue
Robertchester, IL 29707', '9957497066061', 'pearsondominique@gmail.com', 36.9, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d889c-3ed6-11eb-81b0-2af8bc65b5d8', 'Michael Reilly', NULL, 'none', 'female', NULL, 52, 'national-id', '697-31-3304', 'non-profit', '', 'vehicle', 'teSnJVPDDuXgwPOGYOBB', '61', '2020-12-15', 'tourist', '', 3, '0890 Samantha Road Apt. 452
South Mark, DE 32709', '9581 Carpenter Road
Smithborough, OR 78637', '2342791511520', 'tara53@hotmail.com', 35.7, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55d958a-3ed6-11eb-81b0-2af8bc65b5d8', 'Kathy Porter', NULL, 'none', 'male', NULL, 49, 'passport-number', '635-77-9415', 'non-government', '', 'vehicle', 'PURHJkiUbjUQnbFGDdbh', '88', '2020-12-15', 'transit', '', 3, '77976 Jennifer Valley
Markborough, HI 23235', '38897 Hannah Avenue Apt. 306
Colemanview, MI 53511', '8594078390310', 'stacey98@gmail.com', 40.95, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55da26e-3ed6-11eb-81b0-2af8bc65b5d8', 'Tamara Ball', NULL, 'none', 'male', NULL, 9, 'passport-number', '839-38-6422', 'government', '', 'flight', 'DRhOuEzLxSzJleQkGCoH', '36', '2020-12-15', 'business', '', 3, '633 Ortega Skyway
East Nancybury, IN 45237', '5053 Meghan Village
South Philip, MI 89074', '4216097099510', 'randalldaniel@yahoo.com', 37.1, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55db092-3ed6-11eb-81b0-2af8bc65b5d8', 'Joshua Johnson', NULL, 'none', 'male', NULL, 60, 'national-id', '274-44-3868', 'business', '', 'vessel', 'cTJfKlGMWkgBvsNQiExa', '31', '2020-12-15', 'resident', '', 3, '44472 Duncan Meadows Suite 744
North Lisa, ID 32781', '411 Evans Drive Suite 384
New Michelleview, OR 82156', '2642559785896', 'kimberlybrock@smith.com', 35.57, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55dc03c-3ed6-11eb-81b0-2af8bc65b5d8', 'Adam Beard', 'Salama', 'arrival', 'M', 'above', 30, 'national-id', '652-90-5731', 'student', NULL, 'vessel', 'GcEqPRNuEdYqFZAbplkN', '5', '2020-12-15', 'transit', 'None', 3, '1744 Jacob Squares Apt. 239
Grantberg, OR 48500', '4779 Jay ValleyCodyburgh, WI 92646', '4612047960733', 'christopher39@gmail.com', 36.1, '2', 'None', 1, '2020-06-05 00:00:00+03', 2, 1, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55dd0c2-3ed6-11eb-81b0-2af8bc65b5d8', 'Angela Daniels', NULL, 'none', 'male', NULL, 21, 'passport-number', '844-17-3550', 'student', '', 'flight', 'TcXNflKGEJRgtbTaEwZi', '48', '2020-12-15', 'tourist', '', 3, '507 Smith Centers Apt. 264
New Jesus, VA 58214', '8138 Anderson Wells Suite 255
East Jesusborough, SC 93454', '4070569239276', 'krivera@daniel.com', 37.4, '0', NULL, NULL, '2020-06-05 00:00:00+03', 1, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ddd74-3ed6-11eb-81b0-2af8bc65b5d8', 'Amy Bryant', NULL, 'none', 'female', NULL, 71, 'national-id', '349-15-5746', 'religious', '', 'flight', 'bIpssJIwfdnMqoRfFznN', '73', '2020-12-15', 'tourist', '', 3, '135 Jones Viaduct
Wolfport, HI 02563', '551 Dennis Avenue Apt. 938
West Annette, OK 27652', '0264854216082', 'shaneturner@potter-bates.com', 39.4, '2,100', NULL, NULL, '2020-06-05 00:00:00+03', 2, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55dea3a-3ed6-11eb-81b0-2af8bc65b5d8', 'Barry Harmon', NULL, 'none', 'female', NULL, 60, 'passport-number', '542-20-1792', 'non-profit', '', 'flight', 'jfiSxDhfCFkDYViYwkTf', '53', '2020-12-15', 'resident', '', 3, '91616 Vickie Landing
East Christopherhaven, MD 65210', '304 Lloyd Corners Apt. 719
North Charlesborough, UT 35316', '2145244627717', 'krichardson@rubio.net', 35.2, '0,100', NULL, NULL, '2020-06-05 00:00:00+03', 2, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55df746-3ed6-11eb-81b0-2af8bc65b5d8', 'Adrian Davila Jr.', NULL, 'none', 'female', NULL, 87, 'passport-number', '346-13-3024', 'business', '', 'flight', 'QvtRLInUSWyjttQGkXgG', '29', '2020-12-15', 'transit', '', 3, '158 Hughes Court
Hoodland, UT 10060', '3143 Collin Vista
Dustinfort, AZ 80862', '8770144063439', 'alejandraphillips@hotmail.com', 40.6, '0,100', NULL, NULL, '2020-06-05 00:00:00+03', 1, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55e42dc-3ed6-11eb-81b0-2af8bc65b5d8', 'Amber Anderson', NULL, 'none', 'male', NULL, 83, 'passport-number', '294-09-9677', 'government', '', 'vessel', 'MCInLoOHbQcyTfbHLKuP', '73', '2020-12-15', 'tourist', '', 3, '9615 Bennett Wells Apt. 138
Toddside, MN 98274', '2357 Moore Junctions
Michelletown, CA 53763', '6158941372688', 'paul87@hotmail.com', 37.3, '0', NULL, NULL, '2020-06-05 00:00:00+03', 1, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55e4f98-3ed6-11eb-81b0-2af8bc65b5d8', 'Michael Wilson', NULL, 'none', 'female', NULL, 13, 'national-id', '747-48-6572', 'student', '', 'vehicle', 'ZfiNHsBcsqVueVYygTyi', '7', '2020-12-15', 'business', '', 3, '63119 Thomas Terrace Apt. 051
Transtad, WA 57428', 'Unit 4046 Box 9345
DPO AE 69467', '9365969245169', 'regina22@yahoo.com', 40.51, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55e5be6-3ed6-11eb-81b0-2af8bc65b5d8', 'Andrew Adams', NULL, 'none', 'male', NULL, 32, 'passport-number', '160-95-6221', 'student', '', 'vessel', 'TQzuyUOYMeHcVZadeaAw', '24', '2020-12-15', 'transit', '', 3, '0348 Young Ridges
New Sandra, WI 59048', '8374 Kaitlin Plaza
Wallacefurt, MI 55692', '2113348247610', 'dho@ortiz-stewart.info', 37.9, '0,100', NULL, NULL, '2020-06-05 00:00:00+03', 2, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55e6d84-3ed6-11eb-81b0-2af8bc65b5d8', 'Clinton Cervantes', NULL, 'none', 'male', NULL, 39, 'national-id', '062-20-4476', 'non-government', '', 'vessel', 'UxMHUANmPzBijXdySrtW', '88', '2020-12-15', 'transit', '', 3, '6113 Adam Freeway
Michelletown, DE 89842', '76922 Hill Station Apt. 083
Morrisview, WY 96114', '9299760408283', 'prodriguez@perez.info', 40, '2,100', NULL, NULL, '2020-06-05 00:00:00+03', 2, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55e7b6c-3ed6-11eb-81b0-2af8bc65b5d8', 'Dr. John Wallace', NULL, 'none', 'female', NULL, 45, 'passport-number', '478-91-7215', 'non-profit', '', 'vessel', 'DaSzSJZYfdsXBsuSfJns', '38', '2020-12-15', 'transit', '', 3, 'PSC 0289, Box 1755
APO AA 85719', '556 Walters Trail
Morrisonshire, KY 10330', '6380810194211', 'jasonhood@pena.info', 35.11, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55e8832-3ed6-11eb-81b0-2af8bc65b5d8', 'Scott Butler', NULL, 'none', 'male', NULL, 83, 'national-id', '388-37-1446', 'non-government', '', 'vehicle', 'ntNbowyGloIPZXVEqhvG', '10', '2020-12-15', 'resident', '', 3, 'USNS Hernandez
FPO AP 90345', '4452 Mark Estate
Alvaradomouth, CT 51787', '5225223130025', 'claytondustin@yahoo.com', 36.24, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55e950c-3ed6-11eb-81b0-2af8bc65b5d8', 'Warren Ross', NULL, 'none', 'male', NULL, 63, 'national-id', '149-82-2908', 'non-government', '', 'vehicle', 'FMnISwQtNokweinXMTiQ', '21', '2020-12-15', 'resident', '', 3, '0655 Victor Junction
New Vickiebury, ME 29292', '30810 Mary Burg
Brucestad, DE 46134', '7668143793067', 'lspencer@roberts.biz', 40.82, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ea1fa-3ed6-11eb-81b0-2af8bc65b5d8', 'Cody Mills', NULL, 'none', 'male', NULL, 8, 'national-id', '672-35-5787', 'student', '', 'vessel', 'vRRETpzHfpshGdoycQtf', '41', '2020-12-15', 'transit', '', 3, '52992 Keith Prairie Apt. 974
South Gregory, NC 31814', '0740 Jones Path
East Terrychester, VT 12028', '4999733070027', 'jamesaguirre@hotmail.com', 34.83, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55eae16-3ed6-11eb-81b0-2af8bc65b5d8', 'Christina Buckley', NULL, 'none', 'female', NULL, 4, 'passport-number', '713-72-8467', 'student', '', 'vehicle', 'rnWSjNdRxkTLxKWzLFPg', '5', '2020-12-15', 'resident', '', 3, '6289 Ronald Ford
Daviston, NY 75522', '059 Johnson Fall Apt. 100
Lake Deanna, FL 67042', '1918686035456', 'ashley68@yahoo.com', 37.09, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ebca8-3ed6-11eb-81b0-2af8bc65b5d8', 'Margaret Page', NULL, 'none', 'male', NULL, 64, 'passport-number', '315-97-5094', 'non-profit', '', 'vessel', 'fZGRbYtGPkPXlyrBjima', '22', '2020-12-15', 'resident', '', 3, '2484 Tyler Highway Suite 430
New Christinaberg, NH 26373', 'PSC 1292, Box 9669
APO AE 05335', '0769625189437', 'miranda24@rodriguez-freeman.com', 39.71, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ec928-3ed6-11eb-81b0-2af8bc65b5d8', 'Joseph Lawrence', NULL, 'none', 'female', NULL, 58, 'national-id', '826-95-4098', 'student', '', 'vessel', 'zbCDgXNTSWglSzVZgGiQ', '78', '2020-12-15', 'transit', '', 3, '31797 Ryan Gateway Suite 892
Brownfort, PA 97203', '81542 Emily Trail
Clarkport, CA 64720', '3452526818900', 'watsonemily@yahoo.com', 38.87, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ed580-3ed6-11eb-81b0-2af8bc65b5d8', 'Tristan Stephens', NULL, 'none', 'female', NULL, 33, 'passport-number', '877-31-9436', 'business', '', 'flight', 'YPJoApjFWocflqWyLOTe', '6', '2020-12-15', 'business', '', 3, '70709 Johnson Keys Apt. 228
Rhondastad, UT 97587', '7538 Nicole Station Suite 995
Port Melanie, NH 87652', '4127679713146', 'snowhannah@cannon-gross.net', 36.46, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ee2c8-3ed6-11eb-81b0-2af8bc65b5d8', 'Keith Huffman', NULL, 'none', 'male', NULL, 15, 'passport-number', '607-25-4372', 'religious', '', 'vessel', 'jfRzNUaXbjyejblcILPw', '49', '2020-12-15', 'business', '', 3, '69503 Margaret Garden
Raymondhaven, IA 28344', '65621 Lopez Neck
North Brian, NM 46580', '4128152573690', 'wmartinez@hotmail.com', 37.11, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ef146-3ed6-11eb-81b0-2af8bc65b5d8', 'Elizabeth Butler', NULL, 'none', 'male', NULL, 72, 'national-id', '614-56-6029', 'religious', '', 'vessel', 'GKtIGNcMNORNuihopKJm', '3', '2020-12-15', 'business', '', 3, 'Unit 3806 Box 9118
DPO AA 51899', '10722 Mcneil Tunnel
West Michelleshire, OR 22465', '4079040864941', 'pamelajones@yahoo.com', 36.93, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f00e6-3ed6-11eb-81b0-2af8bc65b5d8', 'William Ford', NULL, 'none', 'male', NULL, 64, 'passport-number', '220-24-4844', 'student', '', 'vehicle', 'PQanWrDPdlAOJzdWZEhJ', '52', '2020-12-15', 'tourist', '', 3, '8400 Adam Island
Frankton, KY 35923', '110 Eric Loaf Apt. 201
South Aaronbury, VA 61091', '3483910093768', 'melinda85@yahoo.com', 38.84, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f109a-3ed6-11eb-81b0-2af8bc65b5d8', 'Heather Dominguez', NULL, 'none', 'male', NULL, 26, 'national-id', '375-81-7228', 'non-profit', '', 'vehicle', 'spfcLJNltQYGvfUeElZz', '73', '2020-12-15', 'resident', '', 3, '37566 Hanson Key
South Robertchester, MA 81831', '5699 Melissa Cove Apt. 010
Higginsstad, MI 55589', '6595965846327', 'whitakeranna@gmail.com', 39.48, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f23dc-3ed6-11eb-81b0-2af8bc65b5d8', 'Jason Williams', NULL, 'none', 'female', NULL, 76, 'passport-number', '586-22-3031', 'non-profit', '', 'vessel', 'pJVcXChZgULVmwsPJZCt', '74', '2020-12-15', 'transit', '', 3, 'Unit 4958 Box 0266
DPO AP 77759', '7590 Thomas Common
Anaberg, MI 20252', '6496567967715', 'andrewhowe@fisher.com', 35.65, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f3980-3ed6-11eb-81b0-2af8bc65b5d8', 'Felicia Gardner', NULL, 'none', 'male', NULL, 72, 'passport-number', '444-31-9458', 'government', '', 'flight', 'DSgonTgnnvVQIMjaEqNn', '9', '2020-12-15', 'business', '', 3, '59261 Tony Pines Suite 280
Westborough, NC 10277', '132 Patel Groves
Deckerton, WV 64357', '7807754933922', 'scottleslie@nelson.com', 36.4, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f4b00-3ed6-11eb-81b0-2af8bc65b5d8', 'Joseph Richardson', NULL, 'none', 'male', NULL, 34, 'national-id', '340-53-7511', 'non-government', '', 'vehicle', 'cMoKfkpJEWQMEgLbOEFh', '69', '2020-12-15', 'transit', '', 3, '715 Fred Ville
Myersland, AZ 24077', '00769 Howell Mill Apt. 689
Bowenfurt, NC 84102', '6908857208852', 'fletchercolleen@white.com', 35.4, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f5834-3ed6-11eb-81b0-2af8bc65b5d8', 'Joseph Diaz', NULL, 'none', 'male', NULL, 72, 'passport-number', '426-44-7274', 'non-profit', '', 'vehicle', 'htZuudwZFstZuOrPEHIJ', '31', '2020-12-15', 'resident', '', 3, '562 Simon Lake
West Bruce, CA 70099', '291 Stacey Fork Apt. 087
West Jessica, DC 57023', '3974175363632', 'simpsoncarol@gmail.com', 35.25, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f64fa-3ed6-11eb-81b0-2af8bc65b5d8', 'Jason Leonard', NULL, 'none', 'male', NULL, 40, 'national-id', '426-07-0219', 'non-government', '', 'flight', 'OHWlAXrENeUJVBpwvoYB', '43', '2020-12-15', 'transit', '', 3, '37679 Keith Mission
Lindaburgh, ID 03638', '25796 Johnson Camp
New Victoria, MO 09151', '8644450970248', 'esparzajustin@haynes.net', 39.13, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f71f2-3ed6-11eb-81b0-2af8bc65b5d8', 'Juan Thomas', NULL, 'none', 'male', NULL, 25, 'passport-number', '251-52-1552', 'business', '', 'flight', 'gpqwRUfnAEnDheauVedZ', '21', '2020-12-15', 'transit', '', 3, '31212 Grant Loop Apt. 735
Jenniferstad, NE 08566', '93792 Kevin Court
North Katie, TX 66706', '9224705367767', 'tsantiago@goodman-green.com', 40.39, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f8066-3ed6-11eb-81b0-2af8bc65b5d8', 'Jennifer Kim', NULL, 'none', 'female', NULL, 3, 'national-id', '484-20-5492', 'government', '', 'vehicle', 'ipEVsSSWzZCjrqWAeEPF', '32', '2020-12-15', 'resident', '', 3, '4951 Hughes Course
Port Oliviafort, KS 89868', 'USS Davis
FPO AA 58740', '3222980607059', 'rachel92@hotmail.com', 40.31, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f8d04-3ed6-11eb-81b0-2af8bc65b5d8', 'Spencer Hartman', NULL, 'none', 'male', NULL, 80, 'passport-number', '722-43-7841', 'religious', '', 'vehicle', 'OkEWgCYwBaMUYlKOocvq', '27', '2020-12-15', 'resident', '', 3, '8926 Beard Via
Amyview, AZ 57014', '329 Morgan Ports
South Elizabethmouth, CO 74859', '3431107679016', 'smiller@williamson-morrow.com', 35.18, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55f9998-3ed6-11eb-81b0-2af8bc65b5d8', 'Kimberly Cooper', NULL, 'none', 'male', NULL, 75, 'passport-number', '010-54-3775', 'non-government', '', 'flight', 'zuuXeKVCEszoNeskqtQF', '20', '2020-12-15', 'resident', '', 3, '39330 Taylor Via
West Anna, VA 72941', '220 Wilcox Plains
Sanchezstad, HI 20337', '3388933360501', 'ugarza@patton.biz', 36.7, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55fa604-3ed6-11eb-81b0-2af8bc65b5d8', 'Melissa Williams', NULL, 'none', 'male', NULL, 17, 'passport-number', '424-77-4942', 'non-profit', '', 'vehicle', 'kFxsTGqSiUIYUGCBywNb', '62', '2020-12-15', 'transit', '', 3, '356 Darren Squares
East Claudia, MI 65418', '71368 Cooper Glen
Shawnview, CO 51911', '9175208629756', 'nwallace@lam.com', 35.5, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55fb298-3ed6-11eb-81b0-2af8bc65b5d8', 'Jennifer Kirby', NULL, 'none', 'male', NULL, 81, 'national-id', '146-34-6065', 'business', '', 'vehicle', 'ZdUkmMAQIXIMGqaJGCmw', '7', '2020-12-15', 'resident', '', 3, '9576 Alicia Dam
Walshland, NM 33112', '741 Thomas Stravenue
Floydberg, CA 42501', '3000308359087', 'greenejulia@padilla-lopez.info', 38.5, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55fc13e-3ed6-11eb-81b0-2af8bc65b5d8', 'Daniel Walker', NULL, 'none', 'male', NULL, 42, 'national-id', '158-80-3550', 'non-government', '', 'flight', 'USgXPVlzpAYDdGrDTlHv', '55', '2020-12-15', 'transit', '', 3, '4221 William Mission
Sanchezton, MD 21384', 'PSC 6381, Box 1035
APO AE 60480', '2836593284871', 'eharper@cook-taylor.com', 38.7, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55fd1b0-3ed6-11eb-81b0-2af8bc65b5d8', 'John Brown', NULL, 'none', 'female', NULL, 7, 'passport-number', '410-30-2787', 'religious', '', 'vessel', 'xnautWoIlrQaFMxEFeql', '50', '2020-12-15', 'resident', '', 3, '39724 James Plaza
New Jessicaville, MN 06231', '09594 Joshua Crossing Suite 123
North Carolynstad, ID 35936', '0965613448687', 'jacquelinechavez@baker-guzman.com', 41.18, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55fe178-3ed6-11eb-81b0-2af8bc65b5d8', 'Carolyn Cantrell', NULL, 'none', 'female', NULL, 76, 'passport-number', '537-86-3337', 'student', '', 'vehicle', 'qKoHEZEgrqRPYrvmMOJj', '60', '2020-12-15', 'tourist', '', 3, '084 Garcia Mall
Port Nancy, NJ 32701', '26776 Caitlin Manors Apt. 558
Dominiquemouth, AL 58137', '3011678144046', 'nicole67@castillo.net', 38.89, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ff1d6-3ed6-11eb-81b0-2af8bc65b5d8', 'Sandra Perry', NULL, 'none', 'female', NULL, 74, 'national-id', '189-48-9580', 'religious', '', 'vehicle', 'nlCXxtuBkfUPEDrdrxrp', '11', '2020-12-15', 'tourist', '', 3, '11856 Blanchard Stream
South Matthewchester, DE 71112', '333 Christopher Neck Suite 032
Jamesmouth, AR 59119', '0753907018029', 'megan75@hotmail.com', 38.99, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd55ffffa-3ed6-11eb-81b0-2af8bc65b5d8', 'Crystal Manning', NULL, 'none', 'male', NULL, 29, 'passport-number', '881-44-2274', 'non-government', '', 'flight', 'ghnhRNSrYLSJJvIdTGUU', '76', '2020-12-15', 'transit', '', 3, '66379 Miller Wells
New Margaretbury, CO 66940', '62800 Jessica Spur
North Anna, AZ 57591', '8138604914032', 'brandon60@hotmail.com', 37.55, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5600e96-3ed6-11eb-81b0-2af8bc65b5d8', 'Timothy Hunt MD', NULL, 'none', 'male', NULL, 74, 'national-id', '161-86-9146', 'business', '', 'flight', 'peTDRPENCOYqhBImpiBz', '25', '2020-12-15', 'resident', '', 3, '13394 Benitez Stravenue Suite 092
Watkinschester, MN 91274', '688 Cheryl Park Suite 142
South Williammouth, KY 93799', '8903959884756', 'tiffanysanders@garner.org', 36.49, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5601d3c-3ed6-11eb-81b0-2af8bc65b5d8', 'Bryan Christensen', NULL, 'none', 'male', NULL, 2, 'passport-number', '154-69-0418', 'non-profit', '', 'vehicle', 'rFdyEvRrJqqrgRbmtFfB', '10', '2020-12-15', 'resident', '', 3, '047 Paul Port Suite 780
South Kevinbury, IL 79530', '094 Robert Turnpike
Lake Adam, GA 48651', '8056619496567', 'floresmarc@yahoo.com', 36.13, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5602af2-3ed6-11eb-81b0-2af8bc65b5d8', 'Katherine Martin', NULL, 'none', 'female', NULL, 73, 'passport-number', '596-09-8242', 'non-profit', '', 'vehicle', 'rtAymOgedGqjCnCbKCMK', '24', '2020-12-15', 'resident', '', 3, '8991 Caldwell Prairie
Josephland, PA 71210', '882 Johnson Summit Apt. 133
South Rebekah, NM 64474', '1361290218127', 'tony32@gmail.com', 39.4, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5604172-3ed6-11eb-81b0-2af8bc65b5d8', 'Regina Adams', NULL, 'none', 'male', NULL, 78, 'passport-number', '020-75-7105', 'government', '', 'vehicle', 'YwpzgBFCdMRwhLeBWXJN', '36', '2020-12-15', 'resident', '', 3, 'USNS Gibson
FPO AA 32843', '3414 Lindsay Port Apt. 484
Sheilatown, NJ 28086', '9329845824607', 'matthewsvirginia@figueroa.com', 36.4, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5605400-3ed6-11eb-81b0-2af8bc65b5d8', 'Kayla Benson', NULL, 'none', 'female', NULL, 48, 'national-id', '501-89-8427', 'business', '', 'vehicle', 'CixHxrLFKNSSgTcJOilx', '37', '2020-12-15', 'business', '', 3, '68935 Robert Brooks
Jonesport, KY 73258', '25014 Jerry Expressway Suite 684
South Tracey, ID 66387', '8596559601810', 'kmiller@booth.com', 37.3, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd560629c-3ed6-11eb-81b0-2af8bc65b5d8', 'Juan Wiley', NULL, 'none', 'male', NULL, 17, 'passport-number', '866-28-8646', 'business', '', 'vessel', 'wdSGuGSSEJlLkbNNqvmp', '15', '2020-12-15', 'business', '', 3, 'PSC 9998, Box 5880
APO AP 53306', '645 Clark Cliff Suite 158
New Heatherchester, TN 72415', '0639410366384', 'rgarrison@gmail.com', 37.03, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd560741c-3ed6-11eb-81b0-2af8bc65b5d8', 'Elizabeth Joseph', NULL, 'none', 'female', NULL, 33, 'national-id', '066-55-1324', 'government', '', 'vehicle', 'joPIGjokBctGGUlHmTeC', '34', '2020-12-15', 'resident', '', 3, '7335 Maria Light Suite 654
West Paulbury, UT 12862', 'USS Fuentes
FPO AE 42319', '9577909779594', 'dustin53@reeves.info', 38.83, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56083bc-3ed6-11eb-81b0-2af8bc65b5d8', 'Joseph Ramirez DVM', NULL, 'none', 'male', NULL, 20, 'national-id', '325-39-6663', 'non-government', '', 'vehicle', 'YjeafBvHiJiSoikpDpNc', '46', '2020-12-15', 'transit', '', 3, '7178 Christine Mission
East Davidport, DE 11956', '9984 Ramirez Trail
North Douglas, NH 02709', '9299680141465', 'dhorne@greene-harvey.com', 40.54, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56091b8-3ed6-11eb-81b0-2af8bc65b5d8', 'Bryan Mcdonald', NULL, 'none', 'male', NULL, 32, 'passport-number', '526-99-0388', 'government', '', 'flight', 'UvGDTOrlkQrrNoNKqKse', '82', '2020-12-15', 'resident', '', 3, '3352 Cabrera Club Apt. 111
Cynthiaborough, NJ 53674', '6937 Christopher Parks
East Dominiqueburgh, FL 10046', '7399058229162', 'tinadouglas@pena.net', 38.2, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5609ece-3ed6-11eb-81b0-2af8bc65b5d8', 'James Stone', NULL, 'none', 'male', NULL, 15, 'passport-number', '269-93-2439', 'religious', '', 'vehicle', 'upMabhAahPyLOqLQzQGP', '2', '2020-12-15', 'tourist', '', 3, 'Unit 7041 Box 3762
DPO AA 96237', '413 Sarah Garden Apt. 843
Port Billyside, DE 70373', '8732136941575', 'cynthia58@mills.com', 36.8, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd560adce-3ed6-11eb-81b0-2af8bc65b5d8', 'Yvette Powers', NULL, 'none', 'female', NULL, 81, 'national-id', '040-73-0049', 'student', '', 'flight', 'WnpKXefMzGYTuKRuysgT', '45', '2020-12-15', 'resident', '', 3, '887 Kelsey Garden Apt. 982
Brianmouth, UT 78418', 'Unit 5967 Box 3378
DPO AE 09062', '8340235167287', 'lindamoran@hotmail.com', 40.63, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd560ba58-3ed6-11eb-81b0-2af8bc65b5d8', 'Donna Cochran', NULL, 'none', 'female', NULL, 32, 'national-id', '060-44-7134', 'government', '', 'flight', 'JMPdeKycKbpjvgszffYo', '63', '2020-12-15', 'business', '', 3, '852 Grant Inlet
Kimside, IA 99139', '5551 Lisa Brooks Apt. 034
Millertown, DC 69368', '1654126287566', 'mathewnelson@morrow.com', 37.16, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd560c944-3ed6-11eb-81b0-2af8bc65b5d8', 'Ms. Ann Simpson', NULL, 'none', 'male', NULL, 51, 'passport-number', '333-52-0569', 'non-government', '', 'vehicle', 'aGZJxVcYfOgXKpskfWFm', '25', '2020-12-15', 'transit', '', 3, '505 Montgomery Springs Suite 344
Erinfort, NM 67723', '016 Carolyn Harbors Suite 807
Edwardsstad, ME 16087', '0516429544473', 'navarrochelsea@hernandez-serrano.com', 39.5, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd560d736-3ed6-11eb-81b0-2af8bc65b5d8', 'Jordan Wright', NULL, 'none', 'male', NULL, 26, 'passport-number', '479-29-9571', 'government', '', 'vessel', 'yiVqvlswuotGyJPHTIAl', '30', '2020-12-15', 'business', '', 3, '598 Cheryl Wells Apt. 872
Lake Jacob, NH 39387', '28221 Bob Trafficway
Jesseport, NH 69411', '7517581683897', 'randallallen@young.com', 40.77, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd560e56e-3ed6-11eb-81b0-2af8bc65b5d8', 'Richard Reid', NULL, 'none', 'female', NULL, 15, 'national-id', '451-96-8461', 'religious', '', 'vessel', 'XFVMwPZnJwCiZKyjILgE', '44', '2020-12-15', 'resident', '', 3, '78657 David Station Apt. 814
East Marc, NC 98013', '550 Holland Mission
Karenville, AR 30562', '1489423389055', 'akim@banks-waters.net', 40.85, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd560f2e8-3ed6-11eb-81b0-2af8bc65b5d8', 'Daniel Newman', NULL, 'none', 'female', NULL, 29, 'national-id', '573-84-0066', 'non-government', '', 'vehicle', 'knqQZibKRhDUyKbjUEga', '65', '2020-12-15', 'resident', '', 3, '46856 Smith Green
North Michaelborough, DC 04467', '2373 Thomas Row Apt. 629
Gonzalezside, CO 76335', '3693040569331', 'elizabeth93@gmail.com', 36.07, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5610170-3ed6-11eb-81b0-2af8bc65b5d8', 'Mark Dougherty', NULL, 'none', 'male', NULL, 4, 'passport-number', '007-39-1949', 'non-profit', '', 'vessel', 'TfjduxEUhzGgYXFCZNaY', '60', '2020-12-15', 'resident', '', 3, '80860 Evans Parkways Apt. 950
Escobarland, KS 29266', '4610 Robin Via
East Ashleytown, MI 21927', '7934194673675', 'smithjohn@gmail.com', 40.41, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5610e7c-3ed6-11eb-81b0-2af8bc65b5d8', 'Tina Cain', NULL, 'none', 'male', NULL, 29, 'national-id', '532-38-3426', 'student', '', 'vessel', 'hZuuqsypUxMqvjeLANCx', '33', '2020-12-15', 'business', '', 3, '450 Hebert Crest Suite 473
Martinville, RI 79829', '262 Robert Mountains
East Jeffrey, GA 82454', '9663921554103', 'kylegray@wright.com', 37.67, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5611a8e-3ed6-11eb-81b0-2af8bc65b5d8', 'Robert Alvarez II', NULL, 'none', 'female', NULL, 66, 'national-id', '061-66-8615', 'non-profit', '', 'flight', 'XtYVdvJvozfoznkNIcgP', '86', '2020-12-15', 'transit', '', 3, '28833 Amy Bridge Apt. 618
New Joseshire, WY 36626', '3129 Natalie Valleys
South Whitneyton, NV 04267', '3554830544599', 'michelle89@gmail.com', 37.98, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd561268c-3ed6-11eb-81b0-2af8bc65b5d8', 'Christopher Smith', NULL, 'none', 'female', NULL, 3, 'passport-number', '870-74-3818', 'religious', '', 'vessel', 'AwqYVMuFLUVfCheyXpMB', '53', '2020-12-15', 'tourist', '', 3, '9320 Shane Place
Michaelshire, NJ 09711', '635 Cindy Squares Suite 740
West Lisaburgh, MO 97442', '0058091911284', 'sharppatricia@yahoo.com', 38.6, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5613280-3ed6-11eb-81b0-2af8bc65b5d8', 'Mark Richardson', NULL, 'none', 'female', NULL, 32, 'national-id', '182-90-4856', 'non-government', '', 'vehicle', 'YjgGSCQeaafRGrkjWkLK', '22', '2020-12-15', 'tourist', '', 3, '32775 William Station
Lake Joshua, OR 51183', '9850 Duncan Islands Apt. 996
West Monica, NM 46295', '2620163224713', 'tmitchell@hotmail.com', 36.6, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5613f82-3ed6-11eb-81b0-2af8bc65b5d8', 'Jacqueline Huerta', NULL, 'none', 'male', NULL, 33, 'passport-number', '710-61-9918', 'government', '', 'vehicle', 'lJsKyWHtYgZGpgWbCmqn', '81', '2020-12-15', 'transit', '', 3, '28861 William Hills
Batesville, AK 90014', '40510 Stephens Neck Apt. 985
North Tinahaven, FL 25846', '8596965202603', 'daniel07@roberson-burnett.info', 40.79, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5614bee-3ed6-11eb-81b0-2af8bc65b5d8', 'Daniel Garza', NULL, 'none', 'male', NULL, 10, 'national-id', '630-82-4144', 'business', '', 'flight', 'QLoQjCZDhfOrFiHzOcfH', '17', '2020-12-15', 'transit', '', 3, '0199 Carter Summit
East Jeffreyshire, IL 00824', '193 Tamara Plaza Suite 773
East Tracymouth, CA 53663', '2291860532529', 'seanmiller@hill.com', 36.36, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5615846-3ed6-11eb-81b0-2af8bc65b5d8', 'Tiffany Medina', NULL, 'none', 'female', NULL, 71, 'passport-number', '527-26-2747', 'non-profit', '', 'vessel', 'cFbuvLNCbYJKBGaRfqBj', '62', '2020-12-15', 'business', '', 3, '42958 Smith Rapid Suite 379
South Andrew, AK 76999', '4423 Julie Square
Pearsonshire, ID 89635', '0476036914675', 'francesfrye@gmail.com', 36.11, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5616534-3ed6-11eb-81b0-2af8bc65b5d8', 'Jennifer Alvarez', NULL, 'none', 'female', NULL, 71, 'passport-number', '096-54-4936', 'government', '', 'flight', 'hUDpIfkLbnuKRVDGMCAo', '74', '2020-12-15', 'tourist', '', 3, '69365 Ryan Row Suite 871
East Markside, NY 25722', '472 Wendy Shoals
Garciaview, MA 89567', '2644986441117', 'adam49@gmail.com', 35.93, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5617164-3ed6-11eb-81b0-2af8bc65b5d8', 'Kevin Hubbard', NULL, 'none', 'male', NULL, 66, 'passport-number', '792-55-5241', 'non-profit', '', 'flight', 'hFouXXzTLgBRScFJYqYC', '42', '2020-12-15', 'business', '', 3, '59810 Jill Courts Apt. 015
Port Reneeport, WI 64471', '06225 Scott Estates Suite 256
Seanshire, CA 48038', '3232038169367', 'dicksonamy@gmail.com', 36.53, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5617e02-3ed6-11eb-81b0-2af8bc65b5d8', 'Louis Mullins', NULL, 'none', 'male', NULL, 79, 'passport-number', '864-15-0368', 'business', '', 'vessel', 'VKiPgWEtCUUBXjPeEdnn', '44', '2020-12-15', 'business', '', 3, '57936 Alyssa Vista Apt. 448
Johnland, PA 99874', '9852 Michael Wells Suite 570
West Todd, DC 02809', '6278782017275', 'patrickrobinson@yahoo.com', 38.99, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5618ad2-3ed6-11eb-81b0-2af8bc65b5d8', 'Joseph Lara', NULL, 'none', 'male', NULL, 56, 'national-id', '746-95-4605', 'government', '', 'vessel', 'rPWbrzGAJISzdQOtjuil', '42', '2020-12-15', 'business', '', 3, '156 Laura Mountains Apt. 556
North Susanport, VA 83512', '471 Smith Underpass
Josephshire, NJ 45397', '4377121508824', 'fhall@yahoo.com', 35.77, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5619766-3ed6-11eb-81b0-2af8bc65b5d8', 'Stephanie Martin', NULL, 'none', 'female', NULL, 50, 'national-id', '198-80-4186', 'non-profit', '', 'vessel', 'HZsvAMyLXWEczftXIdyw', '14', '2020-12-15', 'business', '', 3, 'PSC 3379, Box 6123
APO AA 18821', '443 Nicholas Pine
Hendersonfort, WI 03900', '5210516544757', 'brownjonathan@harris.net', 40.65, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd561a526-3ed6-11eb-81b0-2af8bc65b5d8', 'Sarah Gentry', NULL, 'none', 'female', NULL, 48, 'passport-number', '431-28-3525', 'non-government', '', 'flight', 'lrlQeFCggWdxWKctqGcv', '78', '2020-12-15', 'tourist', '', 3, '5614 Spence Course Suite 591
Port Christineburgh, MI 65389', 'Unit 3054 Box 2477
DPO AE 32533', '0967574140716', 'christopherwright@hotmail.com', 39.72, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd561b4d0-3ed6-11eb-81b0-2af8bc65b5d8', 'Lori Walter', NULL, 'none', 'male', NULL, 8, 'national-id', '076-06-1139', 'non-profit', '', 'vessel', 'gMrKuMfZuJRVQkDgBHhW', '85', '2020-12-15', 'tourist', '', 3, '483 Taylor Groves
New Cameron, NM 65224', '28706 Vance Plains
Allisonfurt, MS 35861', '0587639741768', 'kcurry@nelson-martin.biz', 35.4, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd561c268-3ed6-11eb-81b0-2af8bc65b5d8', 'Elizabeth Williams', NULL, 'none', 'female', NULL, 63, 'passport-number', '462-06-2972', 'religious', '', 'vessel', 'SWSWFJEwRFSLtFiWdHcG', '50', '2020-12-15', 'transit', '', 3, '4288 Reeves Parkways Apt. 946
Port Bryanland, NH 16063', '0974 Clark Camp Apt. 755
West Gregory, AL 38786', '7252223363254', 'carneyjames@gmail.com', 40.04, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd561d636-3ed6-11eb-81b0-2af8bc65b5d8', 'Richard Anderson', NULL, 'none', 'male', NULL, 25, 'national-id', '816-05-7672', 'non-government', '', 'vessel', 'HBVspVDmABigEExOlXri', '26', '2020-12-15', 'business', '', 3, '687 Chen Flats Apt. 020
North Melissa, ND 84630', '26048 Ann Row
New Mitchellstad, IN 99199', '9336265918111', 'hquinn@ellis-ortiz.net', 37.72, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd561e608-3ed6-11eb-81b0-2af8bc65b5d8', 'David Thomas', NULL, 'none', 'female', NULL, 77, 'national-id', '716-53-5300', 'non-profit', '', 'vessel', 'GRPcMdXXZATVxnRcgPWZ', '81', '2020-12-15', 'transit', '', 3, '942 Thompson Mission Suite 471
Kellyview, MN 49160', '79440 Howard Village Apt. 150
East Erikafurt, CO 60210', '6188101823845', 'mcdowellanne@yahoo.com', 37.71, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd561f4a4-3ed6-11eb-81b0-2af8bc65b5d8', 'Kimberly Kennedy', NULL, 'none', 'female', NULL, 74, 'national-id', '704-76-6085', 'non-profit', '', 'flight', 'dDfEhAbYhzzpQYlvbNdx', '25', '2020-12-15', 'tourist', '', 3, '78311 Christine Ramp Apt. 054
Lake Derek, KS 84251', 'PSC 0261, Box 6656
APO AP 63033', '8787630114366', 'tammy35@yahoo.com', 37.05, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56203ae-3ed6-11eb-81b0-2af8bc65b5d8', 'Danny Holt', NULL, 'none', 'male', NULL, 26, 'national-id', '245-21-8813', 'business', '', 'vehicle', 'vicQIDFKrlzBFqyCKZVf', '76', '2020-12-15', 'tourist', '', 3, '2489 Christina Common
Collierview, NV 97744', 'USS Hawkins
FPO AE 04844', '6568379928739', 'katelyn27@yahoo.com', 40.19, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56212cc-3ed6-11eb-81b0-2af8bc65b5d8', 'Timothy Ramirez', NULL, 'none', 'male', NULL, 14, 'passport-number', '187-96-4147', 'business', '', 'vehicle', 'UVSgJdqgLeJJNorjiNjh', '16', '2020-12-15', 'resident', '', 3, '5533 Greer Inlet Suite 096
Jenningsburgh, NY 22601', '6634 Jessica Fords Apt. 943
New Jayshire, TX 17389', '6387155279557', 'johnsonamanda@hotmail.com', 37.7, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56221d6-3ed6-11eb-81b0-2af8bc65b5d8', 'Peter Wheeler', NULL, 'none', 'female', NULL, 82, 'passport-number', '409-84-3109', 'business', '', 'vessel', 'gEMmHBUYbCFVnTjflxLZ', '31', '2020-12-15', 'business', '', 3, '6993 Mcintosh Road
Matthewside, AZ 78255', 'Unit 3795 Box 3358
DPO AA 69454', '2582473699892', 'mcraig@hotmail.com', 39.02, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56230e0-3ed6-11eb-81b0-2af8bc65b5d8', 'Ashley Martinez', NULL, 'none', 'male', NULL, 5, 'national-id', '822-52-8919', 'business', '', 'vehicle', 'yVpaECftTOHeyvoShCPd', '84', '2020-12-15', 'tourist', '', 3, '73635 David Orchard
New Catherine, NH 69992', '956 Bennett Rest
South Benjaminhaven, ME 63244', '6194792225402', 'ismith@yahoo.com', 36.3, '2, 2, 1, 1,', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5623eaa-3ed6-11eb-81b0-2af8bc65b5d8', 'David Austin', 'David', 'arrival', 'M', 'above', 36, 'national-id', '016-50-3565', 'non-profit', NULL, 'vehicle', 'tGjpjgGImHJFjNXUhpcf', '43', '2020-12-15', 'business', 'None', 3, 'Unit 8796 Box 6732
DPO AP 37340', '5975 Ochoa Spurs Suite 836North Ashley, VA 35275', '9427154580657', 'aortiz@santiago.com', 34, '0', 'none', 2, '2020-06-05 00:00:00+03', 0, 1, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56253d6-3ed6-11eb-81b0-2af8bc65b5d8', 'Joshua Thomas', NULL, 'none', 'male', NULL, 40, 'national-id', '043-79-2945', 'religious', '', 'vessel', 'YHCdXvtsXWOYvjLlqXcK', '13', '2020-12-15', 'transit', '', 3, '7710 Thomas Station Suite 592
New Sheilafort, CT 31277', '435 Carter Corners Apt. 386
Vazquezland, LA 65607', '6556659360910', 'gmartinez@baldwin.com', 39.35, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5626344-3ed6-11eb-81b0-2af8bc65b5d8', 'Danielle Davis', NULL, 'none', 'male', NULL, 2, 'national-id', '136-40-8124', 'student', '', 'flight', 'AqehhOpsldhDughipvqN', '41', '2020-12-15', 'transit', '', 3, '662 Jones Villages Suite 031
Martinezberg, UT 28183', '760 Elizabeth Estates
Bradshawport, MO 11298', '2447800470295', 'coopervanessa@rocha.com', 37.3, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5627064-3ed6-11eb-81b0-2af8bc65b5d8', 'Anthony Mitchell', NULL, 'none', 'male', NULL, 31, 'national-id', '452-96-7807', 'non-government', '', 'flight', 'RQHFSJjlMKjBOJngwOQM', '21', '2020-12-15', 'tourist', '', 3, '3591 Lydia Station Suite 155
Jamesfort, CT 27743', '5815 Harrington Square
East Richardville, LA 99634', '5238665282354', 'felicia75@boyle.com', 37.4, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5628216-3ed6-11eb-81b0-2af8bc65b5d8', 'Jessica Alexander', NULL, 'none', 'male', NULL, 72, 'passport-number', '694-92-1371', 'non-profit', '', 'flight', 'knLiccVVgoRjqmNTypoG', '31', '2020-12-15', 'business', '', 3, '081 Harris Fort
Nancyborough, DC 76974', '25580 Jennifer Drive Suite 743
Kennethton, AK 65990', '6327052419678', 'catherine53@yahoo.com', 39.95, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56291c0-3ed6-11eb-81b0-2af8bc65b5d8', 'Samantha Gould', NULL, 'none', 'female', NULL, 55, 'passport-number', '822-52-1344', 'religious', '', 'vessel', 'pdPscImYbdJioMYHpUgr', '25', '2020-12-15', 'transit', '', 3, '987 Snow Shoal
Masonbury, AR 22342', '7718 Garza Plaza
New Jeffery, UT 81420', '3920034037114', 'blakedaryl@price.biz', 39.6, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd562a0c0-3ed6-11eb-81b0-2af8bc65b5d8', 'Kimberly Campbell', NULL, 'none', 'female', NULL, 6, 'national-id', '609-30-7915', 'government', '', 'flight', 'rGlTaQVkmuNFFeaqhSkP', '40', '2020-12-15', 'resident', '', 3, '6314 Wright Stravenue Suite 333
West Emilyhaven, KY 27149', '6998 Danielle Meadows
South Lancebury, OR 85872', '3492263266178', 'pnelson@gmail.com', 40.09, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd562ad54-3ed6-11eb-81b0-2af8bc65b5d8', 'Eugene Young', NULL, 'none', 'male', NULL, 12, 'national-id', '723-53-9091', 'religious', '', 'vehicle', 'JGCKxhIYgQQltVrRFSxJ', '27', '2020-12-15', 'transit', '', 3, '25161 Andrea Ferry
Shanebury, AL 69032', '26261 Katelyn Glens Apt. 125
South Jamesfurt, NJ 83170', '7241174816462', 'mitchell05@yahoo.com', 35.35, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd562b9e8-3ed6-11eb-81b0-2af8bc65b5d8', 'Suzanne Howard', NULL, 'none', 'male', NULL, 46, 'national-id', '744-36-0834', 'government', '', 'vessel', 'gPvPnepMQfHtchoZMwmT', '13', '2020-12-15', 'resident', '', 3, '345 Leonard Mountains
Lake Allisonburgh, OR 36448', '390 Kelly Wall Apt. 202
Laurenport, CO 27880', '8750429289427', 'stephentaylor@barker-walker.com', 39.51, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd562e148-3ed6-11eb-81b0-2af8bc65b5d8', 'Jessica Ortega', NULL, 'none', 'female', NULL, 44, 'national-id', '631-85-2869', 'student', '', 'vehicle', 'UvONajICCnpYZcJZSwSs', '22', '2020-12-15', 'transit', '', 3, '2840 Sanchez Inlet
New Robinview, NH 23865', 'Unit 3013 Box 9298
DPO AE 55496', '3917607283397', 'vdavis@hotmail.com', 37.44, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd562ee86-3ed6-11eb-81b0-2af8bc65b5d8', 'Shawn Barr', NULL, 'none', 'male', NULL, 78, 'national-id', '831-57-7477', 'religious', '', 'vehicle', 'wmenafOHqiYarPpFNhjG', '21', '2020-12-15', 'tourist', '', 3, 'PSC 5058, Box 5571
APO AA 58037', '27866 Joshua Spring Apt. 732
East Vickiton, GA 16502', '8338764135419', 'oliviaadams@gmail.com', 40.8, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd562fc64-3ed6-11eb-81b0-2af8bc65b5d8', 'Edward Farley', NULL, 'none', 'male', NULL, 85, 'national-id', '279-50-1089', 'government', '', 'vessel', 'njqHgEIhfUkjAIIXRTTL', '75', '2020-12-15', 'tourist', '', 3, '50821 Murphy Mill
West Deborahburgh, MI 86025', '1207 Henderson Locks Suite 218
Howardhaven, WA 10673', '7417601882991', 'ewalker@hunt-williams.com', 39.63, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5630a4c-3ed6-11eb-81b0-2af8bc65b5d8', 'Rhonda Alexander', NULL, 'none', 'female', NULL, 14, 'passport-number', '765-08-9876', 'business', '', 'flight', 'NhyNERPcfDjpfBPPpYvO', '2', '2020-12-15', 'transit', '', 3, '134 Hannah Crest
Houstonburgh, DC 32485', '1852 Andrews Circle Suite 267
Farleyton, UT 68284', '6639478634702', 'stephaniewhitney@yahoo.com', 41.12, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56317a8-3ed6-11eb-81b0-2af8bc65b5d8', 'Laura Martinez', NULL, 'none', 'female', NULL, 5, 'passport-number', '559-12-5875', 'government', '', 'vessel', 'iEcqqRSAUQVoeAjDyJSE', '27', '2020-12-15', 'tourist', '', 3, '29336 Jessica Knolls Apt. 328
Lake Adam, MI 90823', '678 Angel Fall Apt. 997
Cindyfort, AL 01952', '4244601913466', 'dclarke@mclaughlin.com', 40.64, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5632752-3ed6-11eb-81b0-2af8bc65b5d8', 'Tiffany Nichols', NULL, 'none', 'female', NULL, 51, 'passport-number', '017-90-7504', 'non-government', '', 'flight', 'JFNapmfnVGHbtKCPAbtI', '11', '2020-12-15', 'transit', '', 3, 'PSC 3605, Box 9517
APO AP 92000', '885 Lewis Way
Edwardburgh, HI 09874', '9649813742734', 'grahampaul@kidd-smith.com', 35.58, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56339fe-3ed6-11eb-81b0-2af8bc65b5d8', 'Caleb Mann', NULL, 'none', 'female', NULL, 53, 'passport-number', '044-69-2294', 'student', '', 'flight', 'MnPctKGYNjokbczcTSUh', '86', '2020-12-15', 'resident', '', 3, '654 Amy Union Suite 168
Franklinton, ND 84443', '004 Evans Pines Apt. 305
Angelachester, NH 06387', '0397396510619', 'peterscott@yahoo.com', 37.1, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56349b2-3ed6-11eb-81b0-2af8bc65b5d8', 'Manuel Hayes', NULL, 'none', 'female', NULL, 50, 'passport-number', '054-54-1360', 'non-government', '', 'flight', 'UYxhVoQdmIiEJLLitpfk', '28', '2020-12-15', 'transit', '', 3, 'PSC 5344, Box 1107
APO AP 92953', '5590 Lynch Way Apt. 166
Port Richard, GA 07179', '1482146132396', 'gregoryhicks@hill.org', 38.71, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5635948-3ed6-11eb-81b0-2af8bc65b5d8', 'Michael Higgins', NULL, 'none', 'male', NULL, 51, 'passport-number', '348-37-3381', 'student', '', 'vehicle', 'YPENhPIqdECjApxfaZne', '16', '2020-12-15', 'resident', '', 3, 'Unit 7005 Box 5302
DPO AP 66088', '382 Dale Rapid Apt. 488
West Bonniefort, RI 86535', '9094820289559', 'jamieroberts@hotmail.com', 40.09, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5636924-3ed6-11eb-81b0-2af8bc65b5d8', 'Lori Scott', NULL, 'none', 'male', NULL, 69, 'passport-number', '252-65-7286', 'religious', '', 'vessel', 'tGyffNFlgnheofcOpqXV', '25', '2020-12-15', 'transit', '', 3, '84135 Benjamin Island Suite 576
Hansenview, OH 33818', '06529 Kelsey Ferry Suite 994
West Laurie, DE 49130', '5741702901524', 'sscott@hotmail.com', 39.92, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563781a-3ed6-11eb-81b0-2af8bc65b5d8', 'Breanna Bishop', NULL, 'none', 'female', NULL, 44, 'passport-number', '369-66-7497', 'business', '', 'vehicle', 'TzRqiONJCQoHohHmTKaX', '56', '2020-12-15', 'resident', '', 3, '0390 Ramirez Lake Apt. 901
Martintown, NV 12845', '91708 Bridget Points Apt. 269
Johnsonberg, KS 81683', '0433596552604', 'juanmccall@yahoo.com', 38.3, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5638648-3ed6-11eb-81b0-2af8bc65b5d8', 'Michael Perkins', NULL, 'none', 'female', NULL, 5, 'passport-number', '581-42-0797', 'non-government', '', 'vehicle', 'xALloKSgOJlKfeYvKcqC', '43', '2020-12-15', 'business', '', 3, '272 Benjamin Harbors Apt. 110
Sarabury, DC 92525', '375 Cannon Pike Apt. 017
Johnsonview, ID 90717', '8029218166362', 'victoria50@yahoo.com', 34.96, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56394da-3ed6-11eb-81b0-2af8bc65b5d8', 'Jordan Hurley', NULL, 'none', 'female', NULL, 76, 'national-id', '199-27-3954', 'business', '', 'vessel', 'oKcqQbYbvVEkUowGcWhH', '10', '2020-12-15', 'tourist', '', 3, '89982 Abigail Squares
Lake Amy, TN 99818', 'USNS Barnes
FPO AP 61366', '5791254339994', 'vasquezpatrick@dawson.com', 39.22, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563a43e-3ed6-11eb-81b0-2af8bc65b5d8', 'Joseph Benson', NULL, 'none', 'female', NULL, 5, 'national-id', '391-80-4943', 'government', '', 'vehicle', 'CscfWpmZgHzFfxcrDYjg', '87', '2020-12-15', 'business', '', 3, '65269 Michael Walk
Michaelside, WY 30878', '2058 Joshua Loop Apt. 310
Lake Darlenetown, UT 89149', '5501869013122', 'kmays@villegas.net', 35.77, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563b17c-3ed6-11eb-81b0-2af8bc65b5d8', 'Kelly Wolf', NULL, 'none', 'female', NULL, 60, 'passport-number', '787-52-3554', 'student', '', 'flight', 'XtbcQrWfoLAwHQfTLZJO', '49', '2020-12-15', 'business', '', 3, 'Unit 5919 Box 1601
DPO AA 94502', '8267 Jones Rapids
Jonesburgh, MD 59428', '6745776542504', 'kirstenluna@gmail.com', 38.54, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563bece-3ed6-11eb-81b0-2af8bc65b5d8', 'Emily Rodriguez', NULL, 'none', 'male', NULL, 33, 'national-id', '105-99-1092', 'student', '', 'flight', 'QGcMSDCKLCxJLvfkAlcN', '70', '2020-12-15', 'transit', '', 3, '7697 Young Ville
North Monica, IA 45742', '0036 Johnson Cove Suite 497
Mooreside, NE 54743', '4064720257545', 'barbararyan@hotmail.com', 37.77, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563cb26-3ed6-11eb-81b0-2af8bc65b5d8', 'Rebecca Meyer', NULL, 'none', 'female', NULL, 34, 'national-id', '621-21-4488', 'business', '', 'vehicle', 'pMDdzyPVwtaPpoVDxchX', '71', '2020-12-15', 'business', '', 3, 'PSC 3288, Box 6148
APO AE 20604', '3662 Allison Land Suite 122
Lake Tony, MI 82630', '2037695900043', 'hboyd@jones.com', 41.16, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563d71a-3ed6-11eb-81b0-2af8bc65b5d8', 'Jill Kelly', NULL, 'none', 'female', NULL, 29, 'national-id', '446-49-5395', 'student', '', 'vessel', 'OCkEBpNLTnGnjRzqDMPz', '6', '2020-12-15', 'transit', '', 3, '815 Romero Mountains
Carmenborough, RI 10160', '21157 Donald Highway Apt. 152
North Meganshire, OR 83532', '1451215472535', 'jonesdiamond@chase-garcia.com', 39.77, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563e3d6-3ed6-11eb-81b0-2af8bc65b5d8', 'Barry Walton', NULL, 'none', 'female', NULL, 42, 'national-id', '768-92-6271', 'non-government', '', 'vessel', 'LkrkeQGTyAfnoXBvTRAg', '54', '2020-12-15', 'business', '', 3, '7909 Robinson Street Apt. 391
Lake Michaelborough, AZ 11514', '658 Richards Underpass
Clarkmouth, LA 31771', '3052445875735', 'wendy38@yahoo.com', 35.1, '2,100', NULL, NULL, '2020-06-05 00:00:00+03', 2, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563f13c-3ed6-11eb-81b0-2af8bc65b5d8', 'Catherine West', NULL, 'none', 'male', NULL, 67, 'passport-number', '214-60-5173', 'business', '', 'vessel', 'tdjciViYTBcUuYfsqcTx', '25', '2020-12-15', 'transit', '', 3, '0594 Welch Point Apt. 757
South Jaredbury, MD 07113', '5923 Breanna Mills Apt. 548
Pottertown, CT 11977', '5497743630981', 'hectorlee@stone-payne.com', 37.44, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd563fdf8-3ed6-11eb-81b0-2af8bc65b5d8', 'Ebony Turner', NULL, 'none', 'female', NULL, 19, 'passport-number', '470-19-2901', 'non-profit', '', 'vehicle', 'vgjkvbkUWqEQdeoUoCAV', '70', '2020-12-15', 'transit', '', 3, '4129 Cisneros Coves Suite 082
Guerrerofurt, NV 90429', '437 Joseph Square Suite 337
South Nicholasville, UT 23655', '2168566738176', 'alexander29@burns.com', 38.93, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56409c4-3ed6-11eb-81b0-2af8bc65b5d8', 'Todd Ross', NULL, 'none', 'female', NULL, 60, 'passport-number', '032-61-5477', 'non-government', '', 'vehicle', 'gamNsVRhdTUbltaKqWDc', '79', '2020-12-15', 'transit', '', 3, '387 Jenna Road
Port Blake, LA 45449', '11488 Nguyen Heights Suite 854
New Tanner, NV 31263', '9057000308483', 'kimberlygallagher@brown.biz', 40.47, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564173e-3ed6-11eb-81b0-2af8bc65b5d8', 'Casey Harris MD', NULL, 'none', 'male', NULL, 74, 'national-id', '296-25-2753', 'government', '', 'vessel', 'uCGzLpBjhpqDbzLUyeni', '15', '2020-12-15', 'resident', '', 3, '86463 Catherine Plain Apt. 346
Crawfordstad, MD 77492', '9549 Mandy Shoals Apt. 488
New Albert, LA 71105', '1153589873909', 'crystal01@yahoo.com', 36.2, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5642792-3ed6-11eb-81b0-2af8bc65b5d8', 'Hannah Mason', NULL, 'none', 'female', NULL, 69, 'passport-number', '321-89-2053', 'non-government', '', 'vessel', 'uZEEKQGYemtyNzPrBzMx', '22', '2020-12-15', 'transit', '', 3, '2423 David Harbor
Carolynview, WY 31844', '893 Keith Lodge Suite 344
Gregorystad, DC 65336', '9753669407054', 'bennetthailey@gmail.com', 37.42, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56437f0-3ed6-11eb-81b0-2af8bc65b5d8', 'Robin Johnson', NULL, 'none', 'male', NULL, 16, 'national-id', '350-76-7799', 'non-government', '', 'vehicle', 'xjgzOQYNhYGUxbTcegly', '38', '2020-12-15', 'tourist', '', 3, '118 Jeremiah Fords Apt. 167
Colemanbury, WI 92653', 'Unit 2917 Box 2005
DPO AE 62392', '2274289964935', 'bandrade@romero.com', 38.34, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5645064-3ed6-11eb-81b0-2af8bc65b5d8', 'Susan Baker', NULL, 'none', 'female', NULL, 40, 'national-id', '390-78-5020', 'student', '', 'flight', 'zoqTmisZERJLYOfbjezw', '88', '2020-12-15', 'tourist', '', 3, '86393 Laura Brook
New James, IN 88855', 'PSC 7418, Box 4957
APO AP 79132', '6750613860255', 'christina53@gmail.com', 39.3, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564655e-3ed6-11eb-81b0-2af8bc65b5d8', 'Elizabeth Freeman', NULL, 'none', 'male', NULL, 76, 'passport-number', '897-99-2310', 'religious', '', 'flight', 'unOrYZhZEpXrJaOKPrgk', '70', '2020-12-15', 'tourist', '', 3, '156 Bailey Ranch
Russellfort, CT 37493', '673 Clark Mall
East Davidmouth, ME 23342', '0678065132658', 'kayla77@gmail.com', 35.98, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5647904-3ed6-11eb-81b0-2af8bc65b5d8', 'Rebecca Taylor', NULL, 'none', 'female', NULL, 9, 'national-id', '001-87-0068', 'business', '', 'flight', 'agePueKXtTlNsuMxEdZi', '44', '2020-12-15', 'business', '', 3, '29281 Kelly Divide Apt. 364
South Mariaberg, AZ 90252', '811 Jennifer Branch
Davidbury, ID 07052', '2735374924001', 'egriffith@lozano.com', 35.5, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56486ec-3ed6-11eb-81b0-2af8bc65b5d8', 'Melvin Goodwin', NULL, 'none', 'male', NULL, 49, 'passport-number', '817-56-9307', 'non-profit', '', 'vessel', 'oQecJXGIRDnNMCueYSTB', '3', '2020-12-15', 'business', '', 3, '5088 Hawkins Extension Suite 548
Perkinsville, NV 83208', '6698 Jodi Mountain Suite 432
Port Johnmouth, IL 77517', '8060822304467', 'melissacruz@booth.org', 41.39, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564960a-3ed6-11eb-81b0-2af8bc65b5d8', 'Lindsey Alexander', NULL, 'none', 'male', NULL, 53, 'national-id', '831-19-7470', 'non-profit', '', 'flight', 'mBkNxtHkwnaQGeZoypWS', '3', '2020-12-15', 'resident', '', 3, '72326 Benson Summit Suite 286
North Robertmouth, AZ 48809', 'PSC 2122, Box 0579
APO AE 05707', '6386913059688', 'bskinner@yahoo.com', 34.99, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564a32a-3ed6-11eb-81b0-2af8bc65b5d8', 'Julie Brown', NULL, 'none', 'male', NULL, 11, 'national-id', '688-37-1847', 'non-profit', '', 'flight', 'widghNHEfKBhcslaLMaC', '3', '2020-12-15', 'resident', '', 3, '5620 Terrence Station Apt. 609
Longville, NM 68233', '7376 Wright Summit
Rogersville, OK 31438', '3997474045657', 'veronica08@knapp-houston.org', 41.08, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564af82-3ed6-11eb-81b0-2af8bc65b5d8', 'Duane Morgan', NULL, 'none', 'male', NULL, 3, 'national-id', '017-82-8223', 'student', '', 'flight', 'JshnhOQtneJLwNJkXXIn', '37', '2020-12-15', 'business', '', 3, '46117 Scott Parkway Suite 363
Doughertyton, MN 28286', '279 Moore Spurs
Ellenshire, MI 71265', '2017567545205', 'daniel40@hotmail.com', 38.58, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564bc2a-3ed6-11eb-81b0-2af8bc65b5d8', 'Sara Perry', NULL, 'none', 'female', NULL, 61, 'national-id', '798-03-5188', 'student', '', 'vessel', 'ZkCeYnyVcsDzyMkjRlMQ', '37', '2020-12-15', 'business', '', 3, '151 Hill Pike
Barnettberg, LA 11992', '282 Ashley Crescent Apt. 994
Bradleyville, NY 74395', '7058094133570', 'michael58@williams-johnson.com', 38.73, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564ca44-3ed6-11eb-81b0-2af8bc65b5d8', 'Mrs. Erin Harris', NULL, 'none', 'male', NULL, 35, 'passport-number', '109-74-5178', 'non-government', '', 'flight', 'nuLTLywTsEsCLgCIXRJl', '10', '2020-12-15', 'tourist', '', 3, '3729 Andre Views Apt. 273
Davistown, KS 15876', '861 William Springs Apt. 879
North Dannyside, MA 29930', '9650054831554', 'david43@patel-snyder.com', 35.16, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564d61a-3ed6-11eb-81b0-2af8bc65b5d8', 'Lydia Johnson', NULL, 'none', 'female', NULL, 12, 'passport-number', '803-61-7622', 'student', '', 'vehicle', 'bBMzFBZkOVpPiPpXvrZa', '21', '2020-12-15', 'resident', '', 3, '60104 Margaret Green
Williamschester, UT 13243', '84268 White Wells
New Timothy, WY 26032', '5214018826105', 'wujessica@gmail.com', 39.9, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564e20e-3ed6-11eb-81b0-2af8bc65b5d8', 'Richard Clarke', NULL, 'none', 'female', NULL, 50, 'national-id', '836-50-0984', 'non-government', '', 'vehicle', 'kNrspsJYoWfLilBGODaf', '45', '2020-12-15', 'tourist', '', 3, '41525 Turner Prairie Apt. 316
Gilbertshire, TX 87614', '195 Timothy Valleys
Drakeville, PA 74141', '5750075184437', 'kellyhughes@hotmail.com', 34.55, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd564efb0-3ed6-11eb-81b0-2af8bc65b5d8', 'Robert Steele', NULL, 'none', 'female', NULL, 17, 'national-id', '031-69-5624', 'non-government', '', 'vehicle', 'KFYYBKRmnOTcZZXAaLrD', '57', '2020-12-15', 'transit', '', 3, '9442 Singh Trail
Aguilarburgh, VT 86606', '7393 Flores Curve
Gomezhaven, MN 30607', '5266813264986', 'jacob64@gmail.com', 35.97, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56500cc-3ed6-11eb-81b0-2af8bc65b5d8', 'Dylan Garcia', NULL, 'none', 'female', NULL, 46, 'passport-number', '399-42-1876', 'business', '', 'vessel', 'owUbkfCaLtMKXaLGCRjH', '74', '2020-12-15', 'tourist', '', 3, '510 Nicholas Manor Suite 813
Dixonside, SD 13826', '00100 Wheeler Run Apt. 682
West Tanya, MT 36555', '8651280403714', 'richardterrell@gmail.com', 35.67, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5650ff4-3ed6-11eb-81b0-2af8bc65b5d8', 'Jonathan Zuniga', NULL, 'none', 'male', NULL, 11, 'passport-number', '404-22-3458', 'non-profit', '', 'vehicle', 'KvYhUlzISSiGzRDWgUir', '62', '2020-12-15', 'transit', '', 3, '97216 Mary Inlet
North Lesliemouth, MS 78486', 'Unit 5043 Box 0148
DPO AA 01953', '7106255712569', 'rachel71@hotmail.com', 37.19, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5651f3a-3ed6-11eb-81b0-2af8bc65b5d8', 'Amy King', NULL, 'none', 'male', NULL, 14, 'passport-number', '687-19-5241', 'student', '', 'vessel', 'xsUlzPTQFLzgPxKCgmqT', '49', '2020-12-15', 'resident', '', 3, '6525 Johnson Expressway
Moorefurt, VA 78252', '24308 Robert Forks
South Susan, TN 96146', '6588484172935', 'markodom@carlson.com', 37.3, '2', NULL, NULL, '2020-06-05 00:00:00+03', 1, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5652c50-3ed6-11eb-81b0-2af8bc65b5d8', 'James Johnson', NULL, 'none', 'male', NULL, 51, 'passport-number', '654-32-8220', 'business', '', 'vessel', 'UWUWyXsSxISmiHCbYDpH', '53', '2020-12-15', 'tourist', '', 3, '17622 Bridges Trail Suite 712
New Carolyn, WY 04201', '917 Joshua Spurs Suite 353
North Erica, MI 84051', '9579437650332', 'lindashepherd@frank-powell.com', 41.17, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56538e4-3ed6-11eb-81b0-2af8bc65b5d8', 'Cory Thompson', NULL, 'none', 'female', NULL, 45, 'passport-number', '752-82-5768', 'student', '', 'vessel', 'qHPywtUAcwwVQVxMjIhb', '21', '2020-12-15', 'business', '', 3, '73469 Antonio Islands
West Christinaborough, NC 40155', '4795 Baldwin Stream
West Luis, OR 58825', '5285829317666', 'tinapalmer@obrien.net', 35.27, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd565465e-3ed6-11eb-81b0-2af8bc65b5d8', 'Christopher Morris', NULL, 'none', 'male', NULL, 2, 'passport-number', '174-15-1880', 'business', '', 'flight', 'OLMzrzgLrzDkKGIzmGLQ', '19', '2020-12-15', 'transit', '', 3, 'PSC 1797, Box 9309
APO AA 80787', '663 Daniels Mall
Lake Javierfort, ME 72400', '2083705530268', 'thomaswilson@gmail.com', 41.11, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5655478-3ed6-11eb-81b0-2af8bc65b5d8', 'Janice West', NULL, 'none', 'male', NULL, 77, 'national-id', '331-10-5013', 'non-government', '', 'flight', 'YIMZOeDtwlGHqNMmjKrx', '21', '2020-12-15', 'resident', '', 3, '3239 Preston Underpass
Port Nancy, OK 59815', '23634 Sellers Locks
Cherylville, DE 95777', '1072021383144', 'sthomas@yahoo.com', 38.14, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5656314-3ed6-11eb-81b0-2af8bc65b5d8', 'Kimberly Lee', NULL, 'none', 'male', NULL, 31, 'national-id', '513-89-5065', 'government', '', 'vessel', 'ThugkfITcDbgcrCYZhvJ', '73', '2020-12-15', 'resident', '', 3, 'PSC 9380, Box 8336
APO AE 19604', 'PSC 7620, Box 3681
APO AA 08463', '7174927926236', 'cameronbrennan@white-lopez.biz', 39.11, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd565732c-3ed6-11eb-81b0-2af8bc65b5d8', 'Kyle Reynolds', NULL, 'none', 'female', NULL, 60, 'passport-number', '858-76-5777', 'business', '', 'vessel', 'xRcMfoJqjfrVDpKYUHpu', '4', '2020-12-15', 'business', '', 3, '78945 Robertson Extensions
Lopezview, GA 90715', '098 Eric Roads
Port Carolyn, MD 27621', '1068535915960', 'williamsstephen@yahoo.com', 35.1, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56583bc-3ed6-11eb-81b0-2af8bc65b5d8', 'Tracy Riley', NULL, 'none', 'female', NULL, 64, 'national-id', '793-81-5274', 'student', '', 'flight', 'YhUpKfPYELxupOhrDDcg', '40', '2020-12-15', 'transit', '', 3, '80033 Amber Parkway Apt. 859
New Amandafurt, NE 27632', '98486 Timothy Squares
South Emily, LA 69926', '7199263835600', 'cooperjose@hotmail.com', 37.36, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd56593ca-3ed6-11eb-81b0-2af8bc65b5d8', 'Michael Benson', NULL, 'none', 'female', NULL, 75, 'passport-number', '159-31-8957', 'religious', '', 'vessel', 'TwBnNnwvsNMFKhxkqnxG', '45', '2020-12-15', 'tourist', '', 3, '88101 David Crest
Lauratown, ME 91357', '3045 Ashley Garden Apt. 450
Port Daniel, CT 58080', '3096868894563', 'kara38@taylor-brown.com', 38.4, '9,12,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd565a180-3ed6-11eb-81b0-2af8bc65b5d8', 'Elizabeth Lloyd', NULL, 'none', 'male', NULL, 86, 'passport-number', '141-45-6603', 'business', '', 'vessel', 'kZWgBEImvXBQEeVQFPTu', '77', '2020-12-15', 'transit', '', 3, '65618 Courtney Light Suite 442
Oneillmouth, NC 30296', '723 Sabrina River Apt. 307
Danielsport, WA 83813', '7809886947417', 'ktaylor@garza.com', 38.7, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd565b094-3ed6-11eb-81b0-2af8bc65b5d8', 'Brooke Roberts', NULL, 'none', 'male', NULL, 72, 'national-id', '251-67-3795', 'non-profit', '', 'vehicle', 'ThcvMGHUxTdHKLkBzMui', '37', '2020-12-15', 'tourist', '', 3, '31877 Roberts Ranch Apt. 891
Millermouth, AR 60599', '2163 Thompson Branch
Langberg, MN 81422', '4576821700742', 'iwells@yahoo.com', 38.3, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd565c2b4-3ed6-11eb-81b0-2af8bc65b5d8', 'Alexander Woodard', NULL, 'none', 'male', NULL, 39, 'national-id', '293-85-4459', 'business', '', 'vehicle', 'WGonfdCSXttzCPghskwJ', '13', '2020-12-15', 'tourist', '', 3, '2466 Savage Canyon
South Codyside, MD 17288', '003 Christopher Forest Apt. 195
Natashaville, IN 09586', '1510610897586', 'jonesbarbara@turner.info', 36.9, '2', NULL, NULL, '2020-06-05 00:00:00+03', 1, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd565db00-3ed6-11eb-81b0-2af8bc65b5d8', 'Hannah Schmitt', NULL, 'none', 'female', NULL, 70, 'national-id', '171-88-4236', 'business', '', 'vessel', 'hkqqFubkJFexKyDWywIH', '83', '2020-12-15', 'business', '', 3, '9166 Pham Rue
West Aliciaville, DE 71329', '62045 Edward Road Apt. 106
New Lee, OK 52925', '6876506880164', 'joseph24@hotmail.com', 38.54, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd565e960-3ed6-11eb-81b0-2af8bc65b5d8', 'James Hardy', NULL, 'none', 'male', NULL, 26, 'passport-number', '671-90-6541', 'religious', '', 'vehicle', 'fFOANlyPWgdSmoTNoSJF', '67', '2020-12-15', 'transit', '', 3, '6492 Miller Run
Lake Hector, FL 30928', '34333 Troy Street
East Thomas, LA 13879', '8555878229359', 'robinsonmary@gmail.com', 38.8, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 3, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd565f5f4-3ed6-11eb-81b0-2af8bc65b5d8', 'Teresa Miller', NULL, 'none', 'male', NULL, 2, 'passport-number', '136-31-0906', 'government', '', 'vehicle', 'JhLdDPpVZEIwosAoQUBZ', '67', '2020-12-15', 'transit', '', 3, '13848 Richards Motorway
South Roberta, LA 68541', '275 Ayers Forest
Kennethburgh, ND 55469', '6745260200250', 'angela51@hotmail.com', 37.1, '2,20', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5662128-3ed6-11eb-81b0-2af8bc65b5d8', 'Sarah Mckinney', NULL, 'none', 'male', NULL, 70, 'national-id', '562-66-3988', 'non-government', '', 'vehicle', 'vqugnkSTBxiXZjzNlUxC', '45', '2020-12-15', 'resident', '', 3, '8011 Fisher Harbors
Christinaborough, SC 63359', '724 Martinez Fall Apt. 870
Robinfort, KY 18225', '2903030481679', 'austintorres@gmail.com', 36.16, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5663744-3ed6-11eb-81b0-2af8bc65b5d8', 'Heidi Dunn', NULL, 'none', 'male', NULL, 86, 'passport-number', '553-32-6497', 'non-profit', '', 'vehicle', 'JIjmHaPdAUMHbgmMvvBy', '19', '2020-12-15', 'resident', '', 3, '5103 Rogers Haven Suite 233
Adamland, NY 52875', '4972 Tyler Walk
Roseland, MS 68489', '9265180439115', 'yhart@gmail.com', 36.93, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 4, 0, 3, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd566489c-3ed6-11eb-81b0-2af8bc65b5d8', 'Edward Chavez', NULL, 'none', 'male', NULL, 8, 'passport-number', '024-25-0367', 'non-profit', '', 'flight', 'qsHEouwzRSuHZnkoVIBW', '5', '2020-12-15', 'business', '', 3, 'PSC 1531, Box 8365
APO AA 82717', '5902 James Dale
Richardborough, NC 45080', '8035076508869', 'fisherdaniel@donaldson.com', 36.3, '0', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 2, 0, 2, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5665760-3ed6-11eb-81b0-2af8bc65b5d8', 'Jamie Jones', 'James', 'arrival', 'M', 'above', 45, 'passport-number', '161-94-7780', 'non-profit', NULL, 'vehicle', 'fMTbWuroHbMHCBZbcVfm', '85', '2020-12-15', 'business', 'none', 3, '102 Torres Cove Suite 020
Tinaton, ND 26609', 'Unit 9004 Box 6319DPO AP 42620', '7759589490039', 'heather81@rodriguez.biz', 38.79, '0', 'none', 1, '2020-06-05 00:00:00+03', 0, 1, 3, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5666b1a-3ed6-11eb-81b0-2af8bc65b5d8', 'Daniel Harris', NULL, 'none', 'female', NULL, 34, 'passport-number', '288-73-8094', 'non-profit', '', 'flight', 'sXIpSHSjfsIEHThRTdwQ', '83', '2020-12-15', 'resident', '', 3, '7745 Christina Brook
Port Timothymouth, MO 11834', '2873 Cooley Spurs Apt. 598
New Megan, TN 53899', '2008880258628', 'terrychelsey@wilkerson.com', 39.32, '6,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 1, 2);
INSERT INTO public.et_travellers (active, created_at, id, surname, other_names, category, sex, age_category, age, id_type, id_number, employment, other_employment, mode_of_transport, name_of_transport, seat_number, arrival_date, visiting_purpose, other_purpose, duration_of_stay, physical_address, street_or_ward, phone, email, temp, disease_to_screen, other_symptoms, accept, updated_at, action_taken_id, district_id, location_origin_id, nationality_id, point_of_entry_id, region_id) VALUES (true, '2020-06-05 00:00:00+03', 'd5667bb4-3ed6-11eb-81b0-2af8bc65b5d8', 'Mr. Jonathan Clay', NULL, 'none', 'female', NULL, 4, 'passport-number', '230-72-9603', 'government', '', 'vessel', 'hJpcNBtSPaBumuCDNpYS', '75', '2020-12-15', 'transit', '', 3, '76918 Lisa Land Apt. 581
Sherrichester, NE 38241', '210 Dustin Causeway
South Mary, OH 56128', '5707278766254', 'mathew61@rodriguez.com', 36.9, '1,3,5', NULL, NULL, '2020-06-05 00:00:00+03', 0, NULL, 1, 0, 2, 2);


--
-- Data for Name: et_traveller_visited_areas; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: et_travellers_symptoms; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_decision_reasons; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_decisions; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_disease_survey_qns; Type: TABLE DATA; Schema: public; Owner: mfalme
--

INSERT INTO public.ss_disease_survey_qns (id, title, category, disease_id) VALUES (1, 'did you  take care of any patient with flu like symptoms', 'SELECT', 2);
INSERT INTO public.ss_disease_survey_qns (id, title, category, disease_id) VALUES (2, 'asdfasdf', 'SELECT', 2);
INSERT INTO public.ss_disease_survey_qns (id, title, category, disease_id) VALUES (3, 'asdf', 'SELECT', 2);
INSERT INTO public.ss_disease_survey_qns (id, title, category, disease_id) VALUES (4, 'asdfa', 'SELECT', 2);


--
-- Data for Name: ss_disease_survey_ans; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_risk_assessment; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_risk_factors; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_traveller_decision_reasons; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_traveller_decision_taken; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_traveller_risk_factors; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Data for Name: ss_traveller_symptoms; Type: TABLE DATA; Schema: public; Owner: mfalme
--



--
-- Name: et_action_taken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_action_taken_id_seq', 1, false);


--
-- Name: et_disease_symptoms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_disease_symptoms_id_seq', 1, false);


--
-- Name: et_diseases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_diseases_id_seq', 1, false);


--
-- Name: et_location_diseases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_location_diseases_id_seq', 1, false);


--
-- Name: et_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_locations_id_seq', 1, false);


--
-- Name: et_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_modules_id_seq', 1, false);


--
-- Name: et_point_of_entries_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_point_of_entries_agents_id_seq', 1, false);


--
-- Name: et_point_of_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_point_of_entries_id_seq', 1, false);


--
-- Name: et_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_reports_id_seq', 1, false);


--
-- Name: et_screen_criteria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_screen_criteria_id_seq', 1, false);


--
-- Name: et_ss_criteria_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_ss_criteria_countries_id_seq', 1, false);


--
-- Name: et_ss_criteria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_ss_criteria_id_seq', 1, false);


--
-- Name: et_ss_criteria_symptoms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_ss_criteria_symptoms_id_seq', 1, false);


--
-- Name: et_symptoms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_symptoms_id_seq', 1, false);


--
-- Name: et_traveller_visited_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_traveller_visited_areas_id_seq', 1, false);


--
-- Name: et_travellers_symptoms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.et_travellers_symptoms_id_seq', 186, true);


--
-- Name: ss_decision_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_decision_reasons_id_seq', 1, false);


--
-- Name: ss_decisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_decisions_id_seq', 1, false);


--
-- Name: ss_disease_survey_ans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_disease_survey_ans_id_seq', 1, false);


--
-- Name: ss_disease_survey_qns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_disease_survey_qns_id_seq', 4, true);


--
-- Name: ss_risk_assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_risk_assessment_id_seq', 1, true);


--
-- Name: ss_risk_factors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_risk_factors_id_seq', 1, false);


--
-- Name: ss_traveller_decision_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_traveller_decision_reasons_id_seq', 1, false);


--
-- Name: ss_traveller_decision_taken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_traveller_decision_taken_id_seq', 1, false);


--
-- Name: ss_traveller_risk_factors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_traveller_risk_factors_id_seq', 1, false);


--
-- Name: ss_traveller_symptoms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mfalme
--

SELECT pg_catalog.setval('public.ss_traveller_symptoms_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

