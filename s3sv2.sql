-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 10 2023 г., 07:43
-- Версия сервера: 5.7.33
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `s3sv2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accessories`
--

CREATE TABLE `accessories` (
  `id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `accessories`
--

INSERT INTO `accessories` (`id`, `value`, `price`) VALUES
(1, 'А1', 5000),
(2, 'А2', 7850),
(3, 'А3', 4500),
(4, 'А4', 15850);

-- --------------------------------------------------------

--
-- Структура таблицы `accessories_cross`
--

CREATE TABLE `accessories_cross` (
  `id` int(11) NOT NULL,
  `accessory_cross_id` int(11) NOT NULL,
  `accessory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `configurations`
--

CREATE TABLE `configurations` (
  `id` int(11) NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_id` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `configurations`
--

INSERT INTO `configurations` (`id`, `token`, `chat_id`) VALUES
(1, '6118985684:AAFEcpaaju9snJ70NgduF8hQKw6cfm6Lt8Q', '-');

-- --------------------------------------------------------

--
-- Структура таблицы `door`
--

CREATE TABLE `door` (
  `id` int(11) NOT NULL,
  `internal_coating_id` int(11) NOT NULL,
  `outer_coating_id` int(11) NOT NULL,
  `door_knob_id` int(11) NOT NULL,
  `width_id` int(11) NOT NULL,
  `height_id` int(11) NOT NULL,
  `door_direction_id` int(1) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `door_direction`
--

CREATE TABLE `door_direction` (
  `id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `door_direction`
--

INSERT INTO `door_direction` (`id`, `value`) VALUES
(1, 'Левое'),
(2, 'Правое');

-- --------------------------------------------------------

--
-- Структура таблицы `door_knob_colors`
--

CREATE TABLE `door_knob_colors` (
  `id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `door_knob_colors`
--

INSERT INTO `door_knob_colors` (`id`, `value`, `price`) VALUES
(1, 'желтый', 1750),
(2, 'зеленый', 1750),
(3, 'синий', 1750),
(4, 'красный', 1750);

-- --------------------------------------------------------

--
-- Структура таблицы `height_params`
--

CREATE TABLE `height_params` (
  `id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `height_params`
--

INSERT INTO `height_params` (`id`, `value`, `price`) VALUES
(1, '1950 мм', 750),
(2, '2000 мм', 850),
(3, '2040 мм', 1000),
(4, '2070 мм', 1850);

-- --------------------------------------------------------

--
-- Структура таблицы `internal_colors`
--

CREATE TABLE `internal_colors` (
  `id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `internal_colors`
--

INSERT INTO `internal_colors` (`id`, `value`, `price`) VALUES
(1, 'желтый', 1500),
(2, 'зеленый', 1500),
(3, 'синий', 1500),
(4, 'красный', 1500);

-- --------------------------------------------------------

--
-- Структура таблицы `outer_colors`
--

CREATE TABLE `outer_colors` (
  `id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `outer_colors`
--

INSERT INTO `outer_colors` (`id`, `value`, `price`) VALUES
(1, 'желтый', 1200),
(2, 'зеленый', 1200),
(3, 'синий', 1200),
(4, 'красный', 1200);

-- --------------------------------------------------------

--
-- Структура таблицы `width_params`
--

CREATE TABLE `width_params` (
  `id` int(11) NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `width_params`
--

INSERT INTO `width_params` (`id`, `value`, `price`) VALUES
(1, '850 мм', 650),
(2, '880 мм', 800),
(3, '920 мм', 1020),
(4, '970 мм', 1500);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `accessories_cross`
--
ALTER TABLE `accessories_cross`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accessory_id` (`accessory_id`),
  ADD KEY `accessory_cross_id` (`accessory_cross_id`);

--
-- Индексы таблицы `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `door`
--
ALTER TABLE `door`
  ADD PRIMARY KEY (`id`),
  ADD KEY `door_knob_id` (`door_knob_id`),
  ADD KEY `height_id` (`height_id`),
  ADD KEY `internal_coating_id` (`internal_coating_id`),
  ADD KEY `outer_coating_id` (`outer_coating_id`),
  ADD KEY `width_id` (`width_id`),
  ADD KEY `door_direction` (`door_direction_id`);

--
-- Индексы таблицы `door_direction`
--
ALTER TABLE `door_direction`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `door_knob_colors`
--
ALTER TABLE `door_knob_colors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `height_params`
--
ALTER TABLE `height_params`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `internal_colors`
--
ALTER TABLE `internal_colors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `outer_colors`
--
ALTER TABLE `outer_colors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `width_params`
--
ALTER TABLE `width_params`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `accessories_cross`
--
ALTER TABLE `accessories_cross`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `door`
--
ALTER TABLE `door`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `door_direction`
--
ALTER TABLE `door_direction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `door_knob_colors`
--
ALTER TABLE `door_knob_colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `height_params`
--
ALTER TABLE `height_params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `internal_colors`
--
ALTER TABLE `internal_colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `outer_colors`
--
ALTER TABLE `outer_colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `width_params`
--
ALTER TABLE `width_params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `accessories_cross`
--
ALTER TABLE `accessories_cross`
  ADD CONSTRAINT `accessories_cross_ibfk_1` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`id`),
  ADD CONSTRAINT `accessories_cross_ibfk_2` FOREIGN KEY (`accessory_cross_id`) REFERENCES `door` (`id`);

--
-- Ограничения внешнего ключа таблицы `door`
--
ALTER TABLE `door`
  ADD CONSTRAINT `door_ibfk_1` FOREIGN KEY (`door_knob_id`) REFERENCES `door_knob_colors` (`id`),
  ADD CONSTRAINT `door_ibfk_2` FOREIGN KEY (`height_id`) REFERENCES `height_params` (`id`),
  ADD CONSTRAINT `door_ibfk_3` FOREIGN KEY (`internal_coating_id`) REFERENCES `internal_colors` (`id`),
  ADD CONSTRAINT `door_ibfk_4` FOREIGN KEY (`outer_coating_id`) REFERENCES `outer_colors` (`id`),
  ADD CONSTRAINT `door_ibfk_5` FOREIGN KEY (`width_id`) REFERENCES `width_params` (`id`),
  ADD CONSTRAINT `door_ibfk_6` FOREIGN KEY (`door_direction_id`) REFERENCES `door_direction` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
