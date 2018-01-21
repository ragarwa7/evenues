CREATE TABLE `cities_data` (
  `city_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `city_name` INTEGER UNIQUE NOT NULL,
  `photo_id` INTEGER UNIQUE,
  `description` LONGTEXT NOT NULL
);

CREATE TABLE `city_venue_map` (
  `city_id` INTEGER NOT NULL,
  `v_id` INTEGER NOT NULL,
  `c_i_t_i_e_s__d_a_t_a` INTEGER NOT NULL,
  PRIMARY KEY (`city_id`, `v_id`)
);

CREATE INDEX `idx_city_venue_map__c_i_t_i_e_s__d_a_t_a` ON `city_venue_map` (`c_i_t_i_e_s__d_a_t_a`);

ALTER TABLE `city_venue_map` ADD CONSTRAINT `fk_city_venue_map__c_i_t_i_e_s__d_a_t_a` FOREIGN KEY (`c_i_t_i_e_s__d_a_t_a`) REFERENCES `cities_data` (`city_id`);

CREATE TABLE `V_details` (
  `v_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `v_name` LONGTEXT UNIQUE NOT NULL,
  `area` VARCHAR(255) NOT NULL,
  `address` LONGTEXT NOT NULL,
  `timings` TIME NOT NULL,
  `v_cuisines` LONGTEXT NOT NULL,
  `v_highlights` LONGTEXT NOT NULL,
  `custom_option` BOOLEAN NOT NULL,
  `meal_type` LONGTEXT NOT NULL,
  `budget_lunch` DECIMAL(12, 2) NOT NULL,
  `budget_dinner` DECIMAL(12, 2) NOT NULL,
  `contact_no_1` INTEGER UNIQUE NOT NULL,
  `contact_name_1` LONGTEXT NOT NULL,
  `contact_no_2` INTEGER UNIQUE,
  `contact_name_2` LONGTEXT NOT NULL,
  `email_id_1` LONGTEXT UNIQUE NOT NULL,
  `email_id_2` LONGTEXT UNIQUE,
  `v_ref_link` LONGTEXT NOT NULL,
  `c_i_t_y__v_e_n_u_e__m_a_p_city_id` INTEGER NOT NULL,
  `c_i_t_y__v_e_n_u_e__m_a_p_v_id` INTEGER NOT NULL
);

CREATE INDEX `idx_v_details__c_i_t_y__v_e_n_u_e__m_a_p_city_id_c_i_t_y__v_e_n_` ON `V_details` (`c_i_t_y__v_e_n_u_e__m_a_p_city_id`, `c_i_t_y__v_e_n_u_e__m_a_p_v_id`);

ALTER TABLE `V_details` ADD CONSTRAINT `fk_v_details__c_i_t_y__v_e_n_u_e__m_a_p_city_id__c_i_t_y__v_e_n_` FOREIGN KEY (`c_i_t_y__v_e_n_u_e__m_a_p_city_id`, `c_i_t_y__v_e_n_u_e__m_a_p_v_id`) REFERENCES `city_venue_map` (`city_id`, `v_id`);

CREATE TABLE `customer_details` (
  `customer_id` INTEGER NOT NULL,
  `c_usrname` LONGTEXT NOT NULL,
  `v_id` INTEGER NOT NULL,
  `c_email_id` VARCHAR(255) UNIQUE,
  `c_password` LONGTEXT NOT NULL,
  `c_name` LONGTEXT NOT NULL,
  `c_contact_no` INTEGER UNIQUE NOT NULL,
  `c_contact_no_2` INTEGER UNIQUE,
  `v__d_e_t_a_i_l_s` INTEGER,
  PRIMARY KEY (`customer_id`, `c_usrname`)
);

CREATE INDEX `idx_customer_details__v__d_e_t_a_i_l_s` ON `customer_details` (`v__d_e_t_a_i_l_s`);

ALTER TABLE `customer_details` ADD CONSTRAINT `fk_customer_details__v__d_e_t_a_i_l_s` FOREIGN KEY (`v__d_e_t_a_i_l_s`) REFERENCES `V_details` (`v_id`);

CREATE TABLE `enquiry_data` (
  `enquiry_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `c_id` INTEGER,
  `v_id` INTEGER,
  `date` DATE,
  `guest_count` INTEGER NOT NULL,
  `budget` DECIMAL(12, 2),
  `contact_no` VARCHAR(255) NOT NULL,
  `email_id` VARCHAR(255) NOT NULL,
  `additional_info` LONGTEXT NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id` INTEGER,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname` LONGTEXT
);

CREATE INDEX `idx_enquiry_data__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id_c_u` ON `enquiry_data` (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`);

ALTER TABLE `enquiry_data` ADD CONSTRAINT `fk_enquiry_data__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id__c_u` FOREIGN KEY (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`) REFERENCES `customer_details` (`customer_id`, `c_usrname`);

CREATE TABLE `enquiry_data_v_details` (
  `enquiry_data` INTEGER NOT NULL,
  `v_details` INTEGER NOT NULL,
  PRIMARY KEY (`enquiry_data`, `v_details`)
);

CREATE INDEX `idx_enquiry_data_v_details` ON `enquiry_data_v_details` (`v_details`);

ALTER TABLE `enquiry_data_v_details` ADD CONSTRAINT `fk_enquiry_data_v_details__enquiry_data` FOREIGN KEY (`enquiry_data`) REFERENCES `enquiry_data` (`enquiry_id`);

ALTER TABLE `enquiry_data_v_details` ADD CONSTRAINT `fk_enquiry_data_v_details__v_details` FOREIGN KEY (`v_details`) REFERENCES `V_details` (`v_id`);

CREATE TABLE `highlights_cat` (
  `highlight_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `category` VARCHAR(255) NOT NULL
);

CREATE TABLE `V_HIGHLIGHTS` (
  `v_id` INTEGER NOT NULL,
  `highlight_id` INTEGER NOT NULL,
  `v__d_e_t_a_i_l_s` INTEGER,
  `h_i_g_h_l_i_g_h_t_s__c_a_t` INTEGER NOT NULL,
  PRIMARY KEY (`v_id`, `highlight_id`)
);

CREATE INDEX `idx_v_highlights__h_i_g_h_l_i_g_h_t_s__c_a_t` ON `V_HIGHLIGHTS` (`h_i_g_h_l_i_g_h_t_s__c_a_t`);

CREATE INDEX `idx_v_highlights__v__d_e_t_a_i_l_s` ON `V_HIGHLIGHTS` (`v__d_e_t_a_i_l_s`);

ALTER TABLE `V_HIGHLIGHTS` ADD CONSTRAINT `fk_v_highlights__h_i_g_h_l_i_g_h_t_s__c_a_t` FOREIGN KEY (`h_i_g_h_l_i_g_h_t_s__c_a_t`) REFERENCES `highlights_cat` (`highlight_id`);

ALTER TABLE `V_HIGHLIGHTS` ADD CONSTRAINT `fk_v_highlights__v__d_e_t_a_i_l_s` FOREIGN KEY (`v__d_e_t_a_i_l_s`) REFERENCES `V_details` (`v_id`);

CREATE TABLE `problem_records` (
  `problem_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `v_id` INTEGER,
  `customer_id` INTEGER NOT NULL,
  `problem_cat` LONGTEXT NOT NULL,
  `problem_comment` LONGTEXT NOT NULL,
  `date` DATE NOT NULL,
  `v__d_e_t_a_i_l_s` INTEGER,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id` INTEGER NOT NULL,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname` LONGTEXT NOT NULL
);

CREATE INDEX `idx_problem_records__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id_` ON `problem_records` (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`);

CREATE INDEX `idx_problem_records__v__d_e_t_a_i_l_s` ON `problem_records` (`v__d_e_t_a_i_l_s`);

ALTER TABLE `problem_records` ADD CONSTRAINT `fk_problem_records__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id__` FOREIGN KEY (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`) REFERENCES `customer_details` (`customer_id`, `c_usrname`);

ALTER TABLE `problem_records` ADD CONSTRAINT `fk_problem_records__v__d_e_t_a_i_l_s` FOREIGN KEY (`v__d_e_t_a_i_l_s`) REFERENCES `V_details` (`v_id`);

CREATE TABLE `v_categories` (
  `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `v_id` INTEGER NOT NULL,
  `v_category` LONGTEXT NOT NULL,
  `capacity` INTEGER NOT NULL,
  `v__d_e_t_a_i_l_s` INTEGER NOT NULL
);

CREATE INDEX `idx_v_categories__v__d_e_t_a_i_l_s` ON `v_categories` (`v__d_e_t_a_i_l_s`);

ALTER TABLE `v_categories` ADD CONSTRAINT `fk_v_categories__v__d_e_t_a_i_l_s` FOREIGN KEY (`v__d_e_t_a_i_l_s`) REFERENCES `V_details` (`v_id`);

CREATE TABLE `v_packages` (
  `v_id` INTEGER NOT NULL,
  `package_id` INTEGER NOT NULL,
  PRIMARY KEY (`v_id`, `package_id`)
);

CREATE TABLE `packages_details` (
  `package_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `package_name` VARCHAR(255) NOT NULL,
  `package_price` DECIMAL(12, 2) NOT NULL,
  `package_includes` LONGTEXT NOT NULL,
  `no_appetizer_veg` INTEGER NOT NULL,
  `no_appetizer_nonveg` INTEGER NOT NULL,
  `no_main_veg` INTEGER NOT NULL,
  `no_main_nonveg` INTEGER NOT NULL,
  `accompaniment` LONGTEXT NOT NULL,
  `beverage` BOOLEAN,
  `desserts` LONGTEXT NOT NULL,
  `alcohol` BOOLEAN NOT NULL,
  `alcohot_details` LONGTEXT NOT NULL,
  `terms_conditions` LONGTEXT NOT NULL,
  `v__p_a_c_k_a_g_e_s_v_id` INTEGER NOT NULL,
  `v__p_a_c_k_a_g_e_s_package_id` INTEGER NOT NULL
);

CREATE INDEX `idx_packages_details__v__p_a_c_k_a_g_e_s_v_id_v__p_a_c_k_a_g_e_s` ON `packages_details` (`v__p_a_c_k_a_g_e_s_v_id`, `v__p_a_c_k_a_g_e_s_package_id`);

ALTER TABLE `packages_details` ADD CONSTRAINT `fk_packages_details__v__p_a_c_k_a_g_e_s_v_id__v__p_a_c_k_a_g_e_s` FOREIGN KEY (`v__p_a_c_k_a_g_e_s_v_id`, `v__p_a_c_k_a_g_e_s_package_id`) REFERENCES `v_packages` (`v_id`, `package_id`);

CREATE TABLE `v_booking_details` (
  `v_id` INTEGER NOT NULL,
  `customer_id` INTEGER NOT NULL,
  `package_id` INTEGER NOT NULL,
  `date` DATE NOT NULL,
  `timing` TIME NOT NULL,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id` INTEGER NOT NULL,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname` LONGTEXT NOT NULL,
  `v__d_e_t_a_i_l_s` INTEGER NOT NULL,
  `p_a_c_k_a_g_e_s__d_e_t_a_i_l_s` INTEGER NOT NULL,
  PRIMARY KEY (`v_id`, `customer_id`, `package_id`, `date`)
);

CREATE INDEX `idx_v_booking_details__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_i` ON `v_booking_details` (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`);

CREATE INDEX `idx_v_booking_details__p_a_c_k_a_g_e_s__d_e_t_a_i_l_s` ON `v_booking_details` (`p_a_c_k_a_g_e_s__d_e_t_a_i_l_s`);

CREATE INDEX `idx_v_booking_details__v__d_e_t_a_i_l_s` ON `v_booking_details` (`v__d_e_t_a_i_l_s`);

ALTER TABLE `v_booking_details` ADD CONSTRAINT `fk_v_booking_details__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id` FOREIGN KEY (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`) REFERENCES `customer_details` (`customer_id`, `c_usrname`);

ALTER TABLE `v_booking_details` ADD CONSTRAINT `fk_v_booking_details__p_a_c_k_a_g_e_s__d_e_t_a_i_l_s` FOREIGN KEY (`p_a_c_k_a_g_e_s__d_e_t_a_i_l_s`) REFERENCES `packages_details` (`package_id`);

ALTER TABLE `v_booking_details` ADD CONSTRAINT `fk_v_booking_details__v__d_e_t_a_i_l_s` FOREIGN KEY (`v__d_e_t_a_i_l_s`) REFERENCES `V_details` (`v_id`);

CREATE TABLE `v_details_v_packages` (
  `v_details` INTEGER NOT NULL,
  `v_packages_v_id` INTEGER NOT NULL,
  `v_packages_package_id` INTEGER NOT NULL,
  PRIMARY KEY (`v_details`, `v_packages_v_id`, `v_packages_package_id`)
);

CREATE INDEX `idx_v_details_v_packages` ON `v_details_v_packages` (`v_packages_v_id`, `v_packages_package_id`);

ALTER TABLE `v_details_v_packages` ADD CONSTRAINT `fk_v_details_v_packages__v_details` FOREIGN KEY (`v_details`) REFERENCES `V_details` (`v_id`);

ALTER TABLE `v_details_v_packages` ADD CONSTRAINT `fk_v_details_v_packages__v_packages_v_id__v_packages_package_id` FOREIGN KEY (`v_packages_v_id`, `v_packages_package_id`) REFERENCES `v_packages` (`v_id`, `package_id`);

CREATE TABLE `v_photos_s` (
  `v_id` INTEGER NOT NULL,
  `photo_id` INTEGER NOT NULL,
  `photo_type` VARCHAR(255) NOT NULL,
  `photo_sub_type` VARCHAR(255) NOT NULL,
  `v__d_e_t_a_i_l_s` INTEGER NOT NULL,
  PRIMARY KEY (`v_id`, `photo_id`)
);

CREATE INDEX `idx_v_photos_s__v__d_e_t_a_i_l_s` ON `v_photos_s` (`v__d_e_t_a_i_l_s`);

ALTER TABLE `v_photos_s` ADD CONSTRAINT `fk_v_photos_s__v__d_e_t_a_i_l_s` FOREIGN KEY (`v__d_e_t_a_i_l_s`) REFERENCES `V_details` (`v_id`);

CREATE TABLE `v_reviews` (
  `v_id` INTEGER NOT NULL,
  `v_cat_id` INTEGER NOT NULL,
  `customer_id` INTEGER NOT NULL,
  `v_rating` DECIMAL(12, 2) NOT NULL,
  `v_review_comment` LONGTEXT NOT NULL,
  `review_date` DATE NOT NULL,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id` INTEGER NOT NULL,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname` LONGTEXT NOT NULL,
  `v__d_e_t_a_i_l_s` INTEGER NOT NULL,
  PRIMARY KEY (`v_id`, `v_cat_id`, `customer_id`)
);

CREATE INDEX `idx_v_reviews__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id_c_u_s_` ON `v_reviews` (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`);

CREATE INDEX `idx_v_reviews__v__d_e_t_a_i_l_s` ON `v_reviews` (`v__d_e_t_a_i_l_s`);

ALTER TABLE `v_reviews` ADD CONSTRAINT `fk_v_reviews__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id__c_u_s_` FOREIGN KEY (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`) REFERENCES `customer_details` (`customer_id`, `c_usrname`);

ALTER TABLE `v_reviews` ADD CONSTRAINT `fk_v_reviews__v__d_e_t_a_i_l_s` FOREIGN KEY (`v__d_e_t_a_i_l_s`) REFERENCES `V_details` (`v_id`);

CREATE TABLE `v_rating_cat` (
  `v_cat_id` INTEGER PRIMARY KEY AUTO_INCREMENT,
  `v_cat_name` VARCHAR(255) UNIQUE NOT NULL,
  `v__r_e_v_i_e_w_s_v_id` INTEGER,
  `v__r_e_v_i_e_w_s_v_cat_id` INTEGER,
  `v__r_e_v_i_e_w_s_customer_id` INTEGER
);

CREATE INDEX `idx_v_rating_cat__v__r_e_v_i_e_w_s_v_id_v__r_e_v_i_e_w_s_v_cat_i` ON `v_rating_cat` (`v__r_e_v_i_e_w_s_v_id`, `v__r_e_v_i_e_w_s_v_cat_id`, `v__r_e_v_i_e_w_s_customer_id`);

ALTER TABLE `v_rating_cat` ADD CONSTRAINT `fk_v_rating_cat__v__r_e_v_i_e_w_s_v_id__v__r_e_v_i_e_w_s_v_cat_i` FOREIGN KEY (`v__r_e_v_i_e_w_s_v_id`, `v__r_e_v_i_e_w_s_v_cat_id`, `v__r_e_v_i_e_w_s_customer_id`) REFERENCES `v_reviews` (`v_id`, `v_cat_id`, `customer_id`);

CREATE TABLE `wishlist_data` (
  `v_id` INTEGER NOT NULL,
  `c_id` INTEGER NOT NULL,
  `date_added` DATE NOT NULL,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id` INTEGER NOT NULL,
  `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname` LONGTEXT NOT NULL,
  `v__d_e_t_a_i_l_s` INTEGER NOT NULL,
  PRIMARY KEY (`v_id`, `c_id`)
);

CREATE INDEX `idx_wishlist_data__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id_c_` ON `wishlist_data` (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`);

CREATE INDEX `idx_wishlist_data__v__d_e_t_a_i_l_s` ON `wishlist_data` (`v__d_e_t_a_i_l_s`);

ALTER TABLE `wishlist_data` ADD CONSTRAINT `fk_wishlist_data__c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id__c_` FOREIGN KEY (`c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_customer_id`, `c_u_s_t_o_m_e_r__d_e_t_a_i_l_s_c_usrname`) REFERENCES `customer_details` (`customer_id`, `c_usrname`);

ALTER TABLE `wishlist_data` ADD CONSTRAINT `fk_wishlist_data__v__d_e_t_a_i_l_s` FOREIGN KEY (`v__d_e_t_a_i_l_s`) REFERENCES `V_details` (`v_id`)