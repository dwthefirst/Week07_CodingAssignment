DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;



CREATE TABLE `project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(128) NOT NULL,
  `estimated_hours` decimal(7,2) DEFAULT NULL,
  `actual_hours` decimal(7,2) DEFAULT NULL,
  `difficulty` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `projects`.`step` (
  `step_id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  `step_text` TEXT NOT NULL,
  `step_order` INT NOT NULL,
  PRIMARY KEY (`step_id`),
  INDEX `project_id_idx` (`project_id` ASC) VISIBLE,
  CONSTRAINT `project_id`
    FOREIGN KEY (`project_id`)
    REFERENCES `projects`.`project` (`project_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);
    

CREATE TABLE `projects`.`material` (
  `material_id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  `material_name` VARCHAR(128) NOT NULL,
  `num_required` INT NULL,
  `cost` DECIMAL(7,2) NULL,
  PRIMARY KEY (`material_id`),
  INDEX `project_id_idx` (`project_id` ASC) VISIBLE,
    FOREIGN KEY (`project_id`)
    REFERENCES `projects`.`project` (`project_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);
    
    
   CREATE TABLE `projects`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`category_id`));
  
  
  
  
  
CREATE TABLE `projects`.`project_category` (
  `project_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`project_id`, `category_id`),
  UNIQUE INDEX `project_id_UNIQUE` (`project_id` ASC) VISIBLE,
  UNIQUE INDEX `category_id_UNIQUE` (`category_id` ASC) VISIBLE,

    FOREIGN KEY (`project_id`)
    REFERENCES `projects`.`project` (`project_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,

    FOREIGN KEY (`category_id`)
    REFERENCES `projects`.`category` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);


