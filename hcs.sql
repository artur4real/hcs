-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 16 2024 г., 11:51
-- Версия сервера: 8.0.29
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hcs`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`customer_id`, `full_name`, `address`, `phone`) VALUES
(1, 'Петров Петр Петрович', 'ул. Ленина, д. 10', '+1234567890'),
(2, 'Сидорова Елена Ивановна', 'ул. Пушкина, д. 5', '+0987654321');

-- --------------------------------------------------------

--
-- Структура таблицы `repairs`
--

CREATE TABLE `repairs` (
  `repair_id` int NOT NULL,
  `worker_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `repair_type` varchar(100) NOT NULL,
  `repair_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `repairs`
--

INSERT INTO `repairs` (`repair_id`, `worker_id`, `customer_id`, `repair_type`, `repair_date`) VALUES
(1, 1, 1, 'Замена сантехники', '2024-04-10'),
(2, 2, 2, 'Замена электропроводки', '2024-04-12'),
(3, 3, 1, 'Ремонт стен', '2024-04-15'),
(4, 4, 1, 'Замена сантехники', '2024-04-09'),
(5, 2, 1, 'Замена электропроводки', '2024-04-24');

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `worker_id` int NOT NULL,
  `brigade` varchar(100) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `specialty` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`worker_id`, `brigade`, `qualification`, `specialty`) VALUES
(1, 'Иванов, Петров, Сидоров', 'Мастера', 'Сантехники'),
(2, 'Алиев, Рассохин, Кузякова', 'Стажеры', 'Электрики'),
(3, 'Абрамович, Есаян, Усманов', 'Мастера', 'Строители'),
(4, 'Джалалудинов, Давтян, Бацаев', 'Мастера', 'Сантехники');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `repairs`
--
ALTER TABLE `repairs`
  ADD PRIMARY KEY (`repair_id`),
  ADD KEY `worker_id` (`worker_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`worker_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `repairs`
--
ALTER TABLE `repairs`
  MODIFY `repair_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `worker_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `repairs`
--
ALTER TABLE `repairs`
  ADD CONSTRAINT `repairs_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Ограничения внешнего ключа таблицы `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `repairs` (`worker_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
