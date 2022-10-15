-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2022 at 09:58 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pdc10_classes`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `class_code` varchar(20) NOT NULL,
  `class_desc` varchar(100) NOT NULL,
  `cl_teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `class_rosters`
--

CREATE TABLE `class_rosters` (
  `enrolled_at` varchar(100) NOT NULL,
  `cr_class_code` varchar(20) NOT NULL,
  `cr_student_number` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_first_name` varchar(30) NOT NULL,
  `student_last_name` varchar(30) NOT NULL,
  `student_number` varchar(30) NOT NULL,
  `student_email` varchar(50) NOT NULL,
  `student_contact` varchar(20) NOT NULL,
  `student_program` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `teacher_first_name` varchar(20) NOT NULL,
  `teacher_last_name` varchar(20) NOT NULL,
  `teacher_email` varchar(50) NOT NULL,
  `teacher_contact` varchar(20) NOT NULL,
  `employee_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `class_code` (`class_code`),
  ADD UNIQUE KEY `cl_teacher_id` (`cl_teacher_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `class_rosters`
--
ALTER TABLE `class_rosters`
  ADD PRIMARY KEY (`cr_class_code`),
  ADD UNIQUE KEY `cr_student_number` (`cr_student_number`),
  ADD UNIQUE KEY `cr_class_code` (`cr_class_code`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_email` (`student_email`),
  ADD UNIQUE KEY `student_number` (`student_number`),
  ADD UNIQUE KEY `student_program` (`student_program`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `teacher_email` (`teacher_email`),
  ADD UNIQUE KEY `employee_number` (`employee_number`),
  ADD UNIQUE KEY `teacher_id_2` (`teacher_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `c.class_code` FOREIGN KEY (`class_code`) REFERENCES `class_rosters` (`cr_class_code`),
  ADD CONSTRAINT `c.teacher_id` FOREIGN KEY (`cl_teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `class_rosters`
--
ALTER TABLE `class_rosters`
  ADD CONSTRAINT `classr.class_code` FOREIGN KEY (`cr_class_code`) REFERENCES `classes` (`class_code`),
  ADD CONSTRAINT `classr.student_number` FOREIGN KEY (`cr_student_number`) REFERENCES `students` (`student_number`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `s.student_number` FOREIGN KEY (`student_number`) REFERENCES `class_rosters` (`cr_student_number`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `t.teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `classes` (`cl_teacher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
