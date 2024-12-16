-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Дек 16 2024 г., 08:51
-- Версия сервера: 10.11.10-MariaDB-ubu2204
-- Версия PHP: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ignatiev_ski`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hotel_room`
--

CREATE TABLE `hotel_room` (
  `id_room` int(11) NOT NULL,
  `number` varchar(255) NOT NULL,
  `count_bed` int(11) NOT NULL,
  `type` set('room','house') NOT NULL,
  `discription` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` set('Свободен','Забронирован','Занят') NOT NULL DEFAULT 'Свободен'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `hotel_room`
--

INSERT INTO `hotel_room` (`id_room`, `number`, `count_bed`, `type`, `discription`, `price`, `photo`, `status`) VALUES
(1, '232', 3, 'room', 'норм комната че вы', 82, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', ''),
(2, '82', 3, 'room', 'Вот так лучше', 890, '32', ''),
(3, '43', 2, 'room', 'ну норм', 450, '3', ''),
(4, '232', 3, 'room', 'норм комната че вы', 82, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', ''),
(5, '234', 3, 'room', 'норм комната че вы', 82, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', ''),
(6, '234', 3, 'room', 'норм комната че вы', 82, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', ''),
(7, '234', 3, 'room', 'я бы не жил тут', 82, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', ''),
(8, '199', 4, 'house', 'слово спб вот это да оксимироооооон', 899, 'd0ffb4f192e5f8c8af82cb6ae84fce5726b1596a2aa3e81423c6b7f3a1de6d5f', 'Занят'),
(9, '200', 3, 'house', 'Вполне себе ', 900, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', 'Свободен'),
(12, '893', 4, 'room', 'Просторный, удобный номер', 1600, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', 'Свободен'),
(13, '200', 3, 'house', 'Вполне себе ', 900, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', 'Свободен'),
(14, '200', 3, 'house', 'Вполне себе ', 900, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', 'Свободен'),
(15, '200', 3, 'house', 'Вполне себе ', 900, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', 'Свободен'),
(16, '200', 3, 'house', 'Вполне себе ', 900, '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png', 'Свободен');

-- --------------------------------------------------------

--
-- Структура таблицы `inventory`
--

CREATE TABLE `inventory` (
  `id_inventory` int(11) NOT NULL,
  `name_inventory` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discription` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `inventory`
--

INSERT INTO `inventory` (`id_inventory`, `name_inventory`, `size`, `count`, `price`, `discription`, `photo`) VALUES
(1, 'лыжи', '2м', 40, 250, 'хорошие', '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png'),
(2, 'лыжи', '2м', 40, 250, 'хорошие', '46c7dddd91889e0193b55d6c29037ffe0cd3c09ee4a3582988d8434794320b66.png');

-- --------------------------------------------------------

--
-- Структура таблицы `inventory_order`
--

CREATE TABLE `inventory_order` (
  `id_inorder` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `count_time` varchar(255) NOT NULL,
  `date_broni` datetime NOT NULL,
  `passport` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id_role`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `room_order`
--

CREATE TABLE `room_order` (
  `id_rorder` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `date_broni` datetime NOT NULL,
  `count_night` int(11) NOT NULL,
  `passport` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `FIO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `room_order`
--

INSERT INTO `room_order` (`id_rorder`, `user_id`, `room_id`, `date_broni`, `count_night`, `passport`, `phone`, `FIO`) VALUES
(5, 12, 5, '2024-12-12 18:28:30', 7, '98723', '12345678900', 'Лоу флоу слоу'),
(6, 19, 8, '2024-12-12 18:28:30', 2, '9872223', '123123987', 'Большой Владимир Владимирович'),
(7, 19, 8, '2024-12-12 18:28:30', 2, '9872223', '123123987', 'Большой Владимир Владимирович'),
(8, 19, 8, '2024-12-12 18:28:30', 2, '9872223', '123123987', 'Большой Владимир Владимирович'),
(9, 19, 8, '2024-12-12 18:28:30', 2, '9872223', '123123987', 'Большой Владимир Владимирович'),
(10, 19, 8, '2024-12-12 18:28:30', 2, '9872223', '123123987', 'Большой Вла'),
(11, 19, 8, '2024-12-12 18:28:30', 3, '9872223', '123123987', 'Большой Вла'),
(12, 15, 8, '2024-12-12 18:28:30', 3, '9872223', '123123987', 'Большой Вла'),
(13, 15, 8, '2024-12-12 18:28:30', 3, '9872223', '123123987', 'Большой Вла');

-- --------------------------------------------------------

--
-- Структура таблицы `user_`
--

CREATE TABLE `user_` (
  `id_user` int(11) NOT NULL,
  `FIO` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `passport` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `user_`
--

INSERT INTO `user_` (`id_user`, `FIO`, `username`, `password`, `passport`, `phone`, `email`, `role_id`, `token`) VALUES
(1, 'Влад Владович Владленов', 'vlad', '$2y$13$AKb14odLfI.6SsBNTGrASe8B341v5sZna0NTcWmqipgXqlg5pj/Yi', NULL, '12345678', 'hiha@gmail.com', 2, ''),
(2, 'Влад Владович Владленов', 'vladik', '$2y$13$9JMHwq9Qx6zkkAWoBJnZ6uhhVcBxmKIRKvoV7KkQ7XfPqRJV4saiC', '9281009212', '12345645', 'hihas@gmail.com', 2, ''),
(3, 'Влад Владович Владленов', 'vladika', '$2y$13$oKuBLshwwTN6PKFfVx4jl.VW7LT3qNXf3lBPJybhNw8SyN7Rpb6R.', '9281009299', '12345645', 'hihsas@gmail.com', 2, ''),
(4, 'Олег Олегов ОЛегович', 'oleg', '$2y$13$dGfe0BmsvhftjQtEgMt6ru4ZA6ZNNDuzD.E9BUWa457xIrwHBm5I6', '1273871213', '647124732', 'ol@gmail.com', 2, ''),
(5, 'Олег Олегов ОЛегович', 'pimp', '$2y$13$zRKx13IVtzjGDOB2yssCEu7pEa7NyBpzixI/7uQJZ55gMw86Fwtx.', '1273871213', '647124732', 'ol@gmail.com', 2, 'OeBfHByYes69yM6kk9G27C6t2shn0mH6'),
(6, 'Олег Олегов ОЛегович', 'pimpi', '$2y$13$5v.5SSC3No9PIyA/RyRV1OeJmtya4TwAXxevGAGzCoHN7jX4MPQZK', '1273871213', '647124732', 'ol@gmail.com', 2, 'tCoETvzT4XdI5DSqoC6jQpCJJzvrxv-D'),
(7, 'Олег Олегов ОЛегович', 'pimpik', '$2y$13$27M8hM9VCjGTyxDvZBg9fOtwxYh.9b9QaKHqf2GxkEb3CV7MLaFU2', '127387155', '647124734', 'ol@gmail.com', 2, '5tWwTUcdgOt-zExjUOfsgb0ohp85fXJi'),
(8, 'Олег Олегов ОЛегович', 'pimpikus', '$2y$13$iEoUgJJMA0Dpv9SmOwBy9unCciCHIkb7F/6Xp4vHJF20SX2iZbMyS', '1273871552', '6471247341', 'ol@gmail.com', 2, '-L3sme1aJmefiiicOZPMU5o-gox-QdAs'),
(9, 'Олег Олегов ОЛегови', 'olegic', '$2y$13$xVPVSRLNrdQ1aylu0uVTUep5rseHObGf0mVHX56bb0Ja4gellSdGy', '1273871211', '647124735', 'ol@gmail.com', 2, 'wJnGzKr6AYEGiCX2La9Nh5sreL5Hukf0'),
(11, ' облом', 'oblak', '12345', '123423784982', '5312675', 'nik@gmail.com', 2, 'vuchbdcjhbcwecbbwebc'),
(12, 'Олег Олегов ОЛегови', 'orbita', '$2y$13$H1oiScM0/g3epPM4u5IIXOc2NNsY5wRYp3rsU2O3Am9shRLTalG0a', '1212', '6412', 'change@gmail.com', 2, 'QCqzY-xLZl957ecZ8rZ5JdW09YDvThvD'),
(13, 'Беби фокс', 'babyck', '$2y$13$SV7pBa7ouYfuPiV6oQXNKOyxL3MR8ZlVZNk3DYW6YsWJWPBFBc076', '1871487', '1984', 'puk@gmail.com', 2, '_HuxYkpCaqsE9foxkG2TIkn78k1JWZtL'),
(15, 'небольшой влад', 'admin', '$2y$13$FlQR3BxhaI2dqzhl5f7t/u8/ffFJA.pCqeXDnWJE47XBTw2t6ggEe', NULL, '2', 'admin@admin.ru', 1, 'ZPaTdGVyiuO-B3KDb2udgs6g2iVeRo-1'),
(16, 'небольшой влад', 'kura', '$2y$13$wTZdQko3Mh5YKCJCtB5TMO.799SDo2GqRLsJUtXnyROPT..HTF9My', NULL, '2342', 'admin@admin.ru', 2, '9bqYgb4rqn0P30KiPcE3STXoMJ7n-N2N'),
(17, 'небольшой влад', 'ostap', '$2y$13$mUDn50biVYPJz3UVhUdrMe9mh83FGVt4ZhnVobThRWBgDWeOiXn9.', NULL, '2342555', 'admin@admin.ru', 2, 'VwwMXgP1Li_nj637p1eb9cpCMzBlDkKK'),
(18, 'небольшой влад', 'ostapar', '$2y$13$0m07LJibtBPLu1oMGGyNzuKUcg6g/5KwGmFvrAkE2gIOhGr8gKbaG', NULL, 'asdasd', 'admin@admin.ru', 2, 'H0V6WoQyT4yo5DCir4UA1QM8PCQY7FnE'),
(19, 'Кулаков Владимир Владимирович', 'kulak', '$2y$13$55OEvV5V67609WCsNaObHOLR2uMiB9LrLw6ALETPVm6stlrQXHZRq', NULL, '12345431', 'new@gmail.com', 2, 'aYVnTGbwIsQR8bmk8geVHe1TDq4NyMUY');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `hotel_room`
--
ALTER TABLE `hotel_room`
  ADD PRIMARY KEY (`id_room`);

--
-- Индексы таблицы `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id_inventory`);

--
-- Индексы таблицы `inventory_order`
--
ALTER TABLE `inventory_order`
  ADD PRIMARY KEY (`id_inorder`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Индексы таблицы `room_order`
--
ALTER TABLE `room_order`
  ADD PRIMARY KEY (`id_rorder`),
  ADD KEY `user_id` (`user_id`,`room_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Индексы таблицы `user_`
--
ALTER TABLE `user_`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`,`passport`,`phone`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `hotel_room`
--
ALTER TABLE `hotel_room`
  MODIFY `id_room` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id_inventory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `inventory_order`
--
ALTER TABLE `inventory_order`
  MODIFY `id_inorder` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `room_order`
--
ALTER TABLE `room_order`
  MODIFY `id_rorder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `user_`
--
ALTER TABLE `user_`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `inventory_order`
--
ALTER TABLE `inventory_order`
  ADD CONSTRAINT `inventory_order_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id_inventory`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `room_order`
--
ALTER TABLE `room_order`
  ADD CONSTRAINT `room_order_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `hotel_room` (`id_room`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_`
--
ALTER TABLE `user_`
  ADD CONSTRAINT `user__ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
