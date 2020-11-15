-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2020 a las 19:18:40
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebaintelcost`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bienes_guardados`
--

CREATE TABLE `bienes_guardados` (
  `id` int(11) NOT NULL,
  `id_datos_generales` int(11) NOT NULL,
  `id_estatus` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bienes_guardados`
--

INSERT INTO `bienes_guardados` (`id`, `id_datos_generales`, `id_estatus`) VALUES
(1, 58, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`, `id_estatus`) VALUES
(1, 'Houston', 1),
(2, 'Los Angeles', 1),
(3, 'Miami', 1),
(4, 'New York', 1),
(5, 'Orlando', 1),
(6, 'Washington', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_generales`
--

CREATE TABLE `datos_generales` (
  `id` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `codigo_postal` varchar(255) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `precio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `datos_generales`
--

INSERT INTO `datos_generales` (`id`, `direccion`, `id_ciudad`, `telefono`, `codigo_postal`, `id_tipo`, `precio`) VALUES
(1, 'Ap #549-7395 Ut Rd.', 4, '334-052-0954', '85328', 2, '30.746'),
(2, 'P.O. Box 657, 9831 Cursus St.', 5, '488-441-5521', '04436', 3, '71.045'),
(3, 'Ap #325-2507 Quisque Av.', 2, '623-807-2869', '89804', 3, '36.087'),
(4, '347-866 Laoreet Road', 2, '997-640-8188', '94526-134', 3, '16.048'),
(5, '4732 Ipsum. Rd.', 1, '802-414-8872', '162925', 2, '45.912'),
(6, '672-9576 Consectetuer Road', 5, '355-601-5749', '210020', 3, '64.370'),
(7, '549-5766 Sodales St.', 5, '557-228-6918', '16794', 2, '2.846'),
(8, 'P.O. Box 847, 2589 In Av.', 6, '390-713-8687', '70689', 1, '60.951'),
(9, '175-4344 Nec, Ave', 5, '578-170-6179', 'P0C 0G3', 3, '58.902'),
(10, 'P.O. Box 497, 8679 Turpis. St.', 4, '870-559-3430', '7029', 2, '17.759'),
(11, '844-8312 Molestie Road', 3, '147-920-5435', '5237JG', 2, '91.067'),
(12, 'P.O. Box 494, 674 Amet, Street', 4, '056-617-2556', '684445', 2, '36.155'),
(13, 'P.O. Box 466, 2795 Velit. Avenue', 4, '252-330-0116', '5422', 1, '78.947'),
(14, 'P.O. Box 523, 2126 Aliquet Rd.', 5, '986-825-6899', '37045', 3, '51.817'),
(15, 'Ap #669-7718 Cras St.', 4, '200-935-8531', 'RI9 6RT', 2, '39.561'),
(16, '2211 Malesuada Rd.', 2, '436-742-7954', '31519', 1, '52.433'),
(17, 'P.O. Box 181, 7858 Nisi. St.', 1, '383-252-8216', '83594', 1, '85.641'),
(18, '741-2614 Accumsan Rd.', 3, '487-609-0106', '753543', 3, '78.854'),
(19, '829-3250 In Rd.', 4, '788-832-7076', '783917', 3, '64.471'),
(20, 'Ap #393-3363 Fringilla Road', 5, '335-278-9678', '8635', 1, '47.420'),
(21, 'Ap #247-8024 Curabitur St.', 3, '167-013-1429', '15971', 3, '28.795'),
(22, '995-1099 Id, Road', 6, '491-394-8799', '37-346', 1, '69.505'),
(23, 'Ap #176-8333 Gravida St.', 3, '339-324-8859', '0318YB', 3, '73.231'),
(24, '340-985 Lobortis. Avenue', 6, '049-063-4896', '5411', 3, '83.847'),
(25, '992-7214 Pharetra Rd.', 3, '257-364-7011', '1045SO', 2, '93.907'),
(26, '7705 Fusce St.', 6, '363-540-9113', '9802', 3, '21.796'),
(27, '723-5458 Neque. Ave', 4, '512-886-8792', '1038', 2, '97.134'),
(28, 'Ap #246-9877 Ultricies Rd.', 6, '423-014-6013', '61483', 2, '32.659'),
(29, 'Ap #712-3234 Nunc Road', 3, '334-030-0048', '9738', 1, '14.560'),
(30, '4406 Justo Avenue', 1, '242-441-7733', '38707', 3, '69.433'),
(31, 'Ap #172-6600 Vivamus St.', 4, '710-649-0830', '57503', 3, '1.986'),
(32, 'Ap #728-4099 Et, Ave', 1, '535-501-0707', '0242AN', 2, '73.668'),
(33, '4648 Sem Rd.', 6, '956-749-3273', '94323', 1, '85.996'),
(34, 'Ap #539-4295 Volutpat Avenue', 3, '904-312-9292', '894922', 2, '38.835'),
(35, '500-6214 Tempus, Street', 3, '168-671-0953', '5574', 3, '62.069'),
(36, '233-9001 Cum Rd.', 4, '670-701-8060', '20705', 3, '32.174'),
(37, '4084 Sit St.', 5, '326-023-8622', '02187', 1, '23.492'),
(38, 'P.O. Box 825, 9762 Etiam Street', 3, '343-695-3228', '56309', 3, '42.579'),
(39, '5889 Luctus. Ave', 4, '259-039-5762', '6038', 1, '41.843'),
(40, 'Ap #834-3873 Nullam St.', 1, '809-587-9484', '69526', 3, '94.728'),
(41, 'P.O. Box 711, 706 Dis Rd.', 6, '354-038-8533', '65211', 3, '90.451'),
(42, 'P.O. Box 315, 6041 Duis Avenue', 5, '186-671-4205', '893592', 3, '2.261'),
(43, '5640 Dapibus St.', 6, '906-342-4567', '4263', 3, '76.404'),
(44, '5260 Sed Rd.', 4, '336-903-7567', '92501', 2, '2.055'),
(45, 'Ap #864-1235 Mi Rd.', 5, '723-547-1102', 'G9T 9P2', 3, '99.508'),
(46, '8151 Rutrum Rd.', 3, '594-072-4670', '58567', 2, '7.952'),
(47, 'P.O. Box 926, 1798 Pellentesque St.', 4, '328-063-3034', '0547ID', 2, '48.882'),
(48, 'P.O. Box 264, 6488 Euismod Avenue', 2, '210-220-4305', 'J6H 9S9', 1, '33.141'),
(49, 'Ap #694-1472 Orci Ave', 4, '362-652-3567', '63897', 1, '88.980'),
(50, 'P.O. Box 354, 6477 Eget St.', 2, '593-092-8585', '90970-060', 2, '35.831'),
(51, '128-8013 Imperdiet Avenue', 4, '611-764-9648', '727883', 3, '99.230'),
(52, 'Ap #394-8201 Pede. St.', 4, '057-000-7888', '6390', 1, '82.679'),
(53, 'Ap #210-1906 Mauris St.', 4, '742-185-0661', '4116', 2, '96.998'),
(54, '228-2036 Tincidunt Road', 5, '565-750-7079', '7217', 2, '54.710'),
(55, '681-117 Facilisis Street', 6, '695-936-1302', '83809', 2, '96.281'),
(56, 'P.O. Box 665, 3825 Nec St.', 1, '859-638-8140', '843642', 2, '3.829'),
(57, 'Ap #800-4147 In Street', 2, '324-489-2139', '66013', 3, '70.069'),
(58, '297-8960 Libero. Rd.', 2, '626-297-1082', '9133', 3, '26.514'),
(59, '5605 Nisi Ave', 5, '842-236-6720', '188876', 2, '68.927'),
(60, 'P.O. Box 870, 9855 Tristique Avenue', 3, '114-453-9481', '64899', 2, '67.772'),
(61, 'Ap #214-5963 Metus Road', 1, '337-930-6310', '5290KA', 2, '71.048'),
(62, '869 Tempus St.', 4, '235-726-7602', 'Y4V 5A1', 3, '90.138'),
(63, 'P.O. Box 916, 4350 In Avenue', 4, '292-391-9640', '26271', 3, '70.212'),
(64, 'Ap #768-2635 Eget, Avenue', 3, '909-006-0105', '93246', 2, '74.320'),
(65, 'Ap #581-5945 Ullamcorper Road', 5, '820-970-3451', '35826', 1, '15.782'),
(66, 'Ap #298-502 Dolor. Ave', 5, '339-015-5616', '8625GM', 3, '27.530'),
(67, '569-3972 Malesuada Street', 3, '712-181-4815', '857132', 3, '56.359'),
(68, 'Ap #378-8818 Molestie Ave', 2, '286-311-5133', '39945', 3, '29.789'),
(69, '766 Consequat, St.', 2, '790-137-7352', '71804', 2, '57.408'),
(70, '729-3081 Cubilia Rd.', 6, '888-946-8086', 'F7 0YF', 2, '87.871'),
(71, '457-7987 Curae; Rd.', 6, '760-938-1297', '19418', 2, '43.727'),
(72, '6158 Tempor Rd.', 1, '690-850-4520', 'L18 9SC', 3, '30.425'),
(73, 'Ap #693-2983 Class St.', 4, '213-536-0655', '21712', 2, '23.311'),
(74, '841 Scelerisque Rd.', 1, '367-551-7660', 'YY0A 3TD', 3, '72.611'),
(75, '792-7569 Dolor Rd.', 4, '261-470-7647', '14844', 2, '98.815'),
(76, '444-5718 Ut Rd.', 6, '041-009-6788', '8230', 2, '50.861'),
(77, 'Ap #377-8404 Ipsum Street', 4, '534-916-5827', '37234', 3, '87.808'),
(78, '2425 Rutrum Street', 2, '494-431-4661', 'IC54 7IK', 2, '93.263'),
(79, '344-8412 Nisl. St.', 1, '050-082-4431', '99-113', 1, '99.947'),
(80, '9399 Sem Ave', 1, '909-320-3004', '03082', 2, '69.922'),
(81, 'P.O. Box 284, 8629 Egestas. St.', 5, '196-562-2718', 'A8Z 9N1', 2, '25.541'),
(82, '283-2290 Aliquam Street', 4, '272-977-8230', 'G1C 0L5', 1, '97.152'),
(83, 'P.O. Box 787, 1352 Mollis Rd.', 4, '580-328-0397', '63477', 2, '70.429'),
(84, '571-3448 Ipsum. St.', 4, '451-067-8082', '1688', 3, '9.426'),
(85, '626-4183 Eros. Road', 4, '818-932-2502', '3977', 1, '82.655'),
(86, 'Ap #500-446 Accumsan Ave', 2, '453-561-4737', '3773', 3, '29.354'),
(87, '3703 Quisque Rd.', 5, '020-821-1050', '54983', 1, '96.267'),
(88, '5946 Consectetuer St.', 4, '773-538-6408', 'Q28 3PO', 2, '61.691'),
(89, 'P.O. Box 556, 1951 Vulputate Av.', 1, '670-572-1780', '4484KP', 2, '95.859'),
(90, '727-198 A Road', 1, '821-444-9824', '5962', 1, '82.504'),
(91, 'Ap #271-6835 Tempus St.', 6, '601-485-1049', '703157', 2, '80.965'),
(92, 'P.O. Box 519, 981 Nostra, Avenue', 3, '440-469-6769', '61790-368', 3, '49.957'),
(93, '2759 Faucibus St.', 6, '510-056-8508', '612383', 2, '23.498'),
(94, '5720 Urna, Street', 3, '581-094-0717', 'X45 0FA', 3, '8.187'),
(95, '283-1453 Amet, Avenue', 2, '751-107-3929', 'R1B 4Y7', 1, '32.660'),
(96, 'P.O. Box 169, 7235 Quisque Road', 2, '782-078-8565', '86541', 2, '39.721'),
(97, '6840 Rhoncus. Ave', 3, '845-500-3131', '7112', 3, '97.135'),
(98, '967-7675 A, Rd.', 2, '751-125-7876', '34981', 1, '6.672'),
(99, '227-6771 Ut Street', 1, '262-186-7762', '7131', 3, '17.160'),
(100, 'P.O. Box 432, 4652 Proin Ave', 6, '113-637-2816', '598072', 2, '42.804');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `id_estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `nombre`, `id_estatus`) VALUES
(1, 'Apartamento', 1),
(2, 'Casa', 1),
(3, 'Casa de campo', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bienes_guardados`
--
ALTER TABLE `bienes_guardados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datos_generales`
--
ALTER TABLE `datos_generales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bienes_guardados`
--
ALTER TABLE `bienes_guardados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `datos_generales`
--
ALTER TABLE `datos_generales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
