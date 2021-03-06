
#Использовать fs
#Использовать cli
#Использовать asserts
#Использовать "../internal/cmd"

Перем Тестер;
Перем КаталогСборки;

#Область ОбработчикиСобытий

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт
	
	Тестер = Тестирование;

	ИменаТестов = Новый Массив;
	ИменаТестов.Добавить("ТестДолжен_КонвертироватьXML_XML");
	ИменаТестов.Добавить("ТестДолжен_КонвертироватьEDT_XML");
	ИменаТестов.Добавить("ТестДолжен_КонвертироватьXML_JSON");
	ИменаТестов.Добавить("ТестДолжен_КонвертироватьEDT_JSON");
	ИменаТестов.Добавить("ТестДолжен_КонвертироватьXMLИзКонфигурационногоФайла");
	ИменаТестов.Добавить("ТестДолжен_КонвертироватьEDTИзКонфигурационногоФайла");

	Возврат ИменаТестов;

КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	
	КаталогСборки = Тестер.ИмяВременногоФайла();
	ФС.ОбеспечитьПустойКаталог(КаталогСборки);

КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт

	Тестер.УдалитьВременныеФайлы();

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиТестов

Процедура ТестДолжен_КонвертироватьXML_XML() Экспорт

	ИмяФайлаРезультатов = ОбъединитьПути(КаталогСборки, "coverageXML.xml");

	Аргументы = Новый Массив;
	ДобавитьАргументInput(Аргументы,     ФайлПокрытия());
	ДобавитьАргументOutput(Аргументы,    ИмяФайлаРезультатов);
	ДобавитьАргументWorkspace(Аргументы, КаталогТестовыхДанных());
	ДобавитьАргументSources(Аргументы,   КаталогИсходниковXML());
	ДобавитьАргументFormat(Аргументы,    "XML");
	
	ВыполнитьКоманду(Аргументы);

	Утверждения.ПроверитьИстину(
		ФС.ФайлСуществует(ИмяФайлаРезультатов), 
		"Файл с результатами должен существовать");
	
	ЧислоСтрок = ЧислоСтрокРезультата(ИмяФайлаРезультатов);
	
	Утверждения.ПроверитьРавенство(ЧислоСтрок, 393, 
		"Проверка количества строк в результате");
	
КонецПроцедуры	

Процедура ТестДолжен_КонвертироватьEDT_XML() Экспорт

	ИмяФайлаРезультатов = ОбъединитьПути(КаталогСборки, "coverageEDT.xml");
	
	Аргументы = Новый Массив;
	ДобавитьАргументInput(Аргументы,     ФайлПокрытия());
	ДобавитьАргументOutput(Аргументы,    ИмяФайлаРезультатов);
	ДобавитьАргументWorkspace(Аргументы, КаталогТестовыхДанных());
	ДобавитьАргументSources(Аргументы,   КаталогИсходниковEDT());
	ДобавитьАргументFormat(Аргументы,    "EDT");

	ВыполнитьКоманду(Аргументы);

	Утверждения.ПроверитьИстину(
		ФС.ФайлСуществует(ИмяФайлаРезультатов), 
		"Файл с результатами должен существовать");
	
	ЧислоСтрок = ЧислоСтрокРезультата(ИмяФайлаРезультатов);

	Утверждения.ПроверитьРавенство(ЧислоСтрок, 393, 
		"Проверка количества строк в результате");
	
КонецПроцедуры	

Процедура ТестДолжен_КонвертироватьXML_JSON() Экспорт

	ИмяФайлаРезультатов = ОбъединитьПути(КаталогСборки, "coverageXML.json");

	Аргументы = Новый Массив;
	ДобавитьАргументInput(Аргументы,     ФайлПокрытия());
	ДобавитьАргументOutput(Аргументы,    ИмяФайлаРезультатов);
	ДобавитьАргументWorkspace(Аргументы, КаталогТестовыхДанных());
	ДобавитьАргументSources(Аргументы,   КаталогИсходниковXML());
	ДобавитьАргументFormat(Аргументы,    "XML");

	ДобавитьФлагJSON(Аргументы);
	
	ВыполнитьКоманду(Аргументы);

	Утверждения.ПроверитьИстину(
		ФС.ФайлСуществует(ИмяФайлаРезультатов), 
		"Файл с результатами должен существовать");
	
	ЧислоСтрок = ЧислоСтрокРезультата(ИмяФайлаРезультатов);

	Утверждения.ПроверитьРавенство(ЧислоСтрок, 1790, 
		"Проверка количества строк в результате");
	
КонецПроцедуры	

Процедура ТестДолжен_КонвертироватьEDT_JSON() Экспорт

	ИмяФайлаРезультатов = ОбъединитьПути(КаталогСборки, "coverageEDT.json");
	
	Аргументы = Новый Массив;
	ДобавитьАргументInput(Аргументы,     ФайлПокрытия());
	ДобавитьАргументOutput(Аргументы,    ИмяФайлаРезультатов);
	ДобавитьАргументWorkspace(Аргументы, КаталогТестовыхДанных());
	ДобавитьАргументSources(Аргументы,   КаталогИсходниковEDT());
	ДобавитьАргументFormat(Аргументы,    "EDT");

	ДобавитьФлагJSON(Аргументы);
	
	ВыполнитьКоманду(Аргументы);

	Утверждения.ПроверитьИстину(
		ФС.ФайлСуществует(ИмяФайлаРезультатов), 
		"Файл с результатами должен существовать");
	
	ЧислоСтрок = ЧислоСтрокРезультата(ИмяФайлаРезультатов);

	Утверждения.ПроверитьРавенство(ЧислоСтрок, 1790, 
		"Проверка количества строк в результате");
	
КонецПроцедуры	

Процедура ТестДолжен_КонвертироватьXMLИзКонфигурационногоФайла() Экспорт
	
	ИмяФайлаРезультатов  = ОбъединитьПути(КаталогСборки, "coverageXML.json");
	ИмяФайлаКонфигурации = ОбъединитьПути(КаталогТестовыхДанных(), "configs", "configurationXML.json");

	Аргументы = Новый Массив;
	ДобавитьАргументInput(Аргументы,     ФайлПокрытия());
	ДобавитьАргументOutput(Аргументы,    ИмяФайлаРезультатов);
	ДобавитьАргументWorkspace(Аргументы, КаталогТестовыхДанных());
	ДобавитьАргументСonfig(Аргументы,    ИмяФайлаКонфигурации);

	ВыполнитьКоманду(Аргументы);

	Утверждения.ПроверитьИстину(
		ФС.ФайлСуществует(ИмяФайлаРезультатов), 
		"Файл с результатами должен существовать");
	
	ЧислоСтрок = ЧислоСтрокРезультата(ИмяФайлаРезультатов);
	
	Утверждения.ПроверитьРавенство(ЧислоСтрок, 393, 
		"Проверка количества строк в результате");

КонецПроцедуры

Процедура ТестДолжен_КонвертироватьEDTИзКонфигурационногоФайла() Экспорт
	
	ИмяФайлаРезультатов  = ОбъединитьПути(КаталогСборки, "coverageEDT.json");
	ИмяФайлаКонфигурации = ОбъединитьПути(КаталогТестовыхДанных(), "configs", "configurationEDT.json");

	Аргументы = Новый Массив;
	ДобавитьАргументInput(Аргументы,     ФайлПокрытия());
	ДобавитьАргументOutput(Аргументы,    ИмяФайлаРезультатов);
	ДобавитьАргументWorkspace(Аргументы, КаталогТестовыхДанных());
	ДобавитьАргументСonfig(Аргументы,    ИмяФайлаКонфигурации);

	ВыполнитьКоманду(Аргументы);

	Утверждения.ПроверитьИстину(
		ФС.ФайлСуществует(ИмяФайлаРезультатов), 
		"Файл с результатами должен существовать");
	
	ЧислоСтрок = ЧислоСтрокРезультата(ИмяФайлаРезультатов);
	
	Утверждения.ПроверитьРавенство(ЧислоСтрок, 393, 
		"Проверка количества строк в результате");

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция КаталогТестовыхДанных()
	Возврат ОбъединитьПути("tests", "testdata");
КонецФункции

Функция ФайлПокрытия()
	Возврат ОбъединитьПути(КаталогТестовыхДанных(), "coverage.csv");
КонецФункции

Функция КаталогИсходниковXML()
	Возврат ОбъединитьПути("src", "xml");
КонецФункции

Функция КаталогИсходниковEDT()
	Возврат ОбъединитьПути("src", "edt");
КонецФункции

Процедура ДобавитьАргументInput(Аргументы, Значение)
	
	Аргументы.Добавить("--input");
	Аргументы.Добавить(Значение);

КонецПроцедуры

Процедура ДобавитьАргументOutput(Аргументы, Значение)
	
	Аргументы.Добавить("--output");
	Аргументы.Добавить(Значение);

КонецПроцедуры

Процедура ДобавитьАргументWorkspace(Аргументы, Значение)
	
	Аргументы.Добавить("--workspace");
	Аргументы.Добавить(Значение);

КонецПроцедуры

Процедура ДобавитьАргументSources(Аргументы, Значение)
	
	Аргументы.Добавить("--sources");
	Аргументы.Добавить(Значение);

КонецПроцедуры

Процедура ДобавитьАргументFormat(Аргументы, Значение)
	
	Аргументы.Добавить("--format");
	Аргументы.Добавить(Значение);

КонецПроцедуры

Процедура ДобавитьАргументСonfig(Аргументы, Значение)

	Аргументы.Добавить("--config");
	Аргументы.Добавить(Значение);

КонецПроцедуры

Процедура ДобавитьФлагJSON(Аргументы)
	Аргументы.Добавить("--json");
КонецПроцедуры

Процедура ВыполнитьКоманду(Аргументы) 
	
	Команда = Новый КомандаПриложения("testapp", "Тестовое приложения", Новый КомандаКонвертировать());
	Команда.Опция("d debug", Ложь, "Режим отладки").ТБулево();
	Команда.НачалоЗапуска();
	Команда.Запуск(Аргументы);

КонецПроцедуры

Функция ЧислоСтрокРезультата(ИмяФайлаРезультатов) 
	
	ЧтениеТекста = Новый ЧтениеТекста;
	ЧтениеТекста.Открыть(ИмяФайлаРезультатов);
	ЧислоСтрок = СтрЧислоСтрок(ЧтениеТекста.Прочитать());
	ЧтениеТекста.Закрыть();

	Возврат ЧислоСтрок;

КонецФункции

#КонецОбласти
