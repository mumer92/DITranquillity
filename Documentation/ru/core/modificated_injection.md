# Модификаторы внедрения

Одна из отличительных возможностей DITranquillity по сравнению со Swinject это модификаторы внедрения.
Они позволяют достаточно красиво изменить способ внедрения/получения объекта, прям по месту, а, не указывая его как-то отдельно от самого внедрения/получения.
Но зачем много слов? давайте посмотрим на них в деле:

## Тэги
Самый первый модификатор, это тэгирование. Тут ничего необычного нет - тэги поддерживают большая часть библиотек, но синтаксис для указания тега при внедрении достаточно специфичный.

Но прежде чем внедрять по тэгу, давайте разберемся, что есть тэг в моей библиотеке:
```Swift
protocol Tag1 {}
enum Tag2 {}
class Tag3 {}
struct Tag4 {}
typealias Tag5 = Tag1 & Tag3
```
Все описанные здесь варианты могут являться тэгами для библиотеки. Ну а если словами - то любой Уникальный тип, это тэг. При этом `typealias` на один тип, не порождает новый тип, а создает лишь синоним, этому типу.
Я рекомендую для объявления тэгов использовать протоколы - так проще безопасней, и они могут объединяться.

Что такое тэг определились - теперь надо его привязать к объекту/компоненту. Это делается с помощью операции [указания сервисов](registration_and_service.md#Указание-сервисов):
```Swift
container.register(Cat.init)
    .as(Cat.self, tag: Felix.self)
    .as(Animal.self, tag: Felix.self)
container.register(Dog.init)
    .as(Dog.self, tag: Rex.self)
    .as(Animal.self, tag: Rex.self)
```
Обращаю внимание, что даже для того чтобы просто добавить тэг, придётся указать сервис, но в качестве сервиса указать самого себя. Это небольшое неудобство вызвано тем, что ситуации когда нужно указать тэг не привязанный к сервису встречаются редко, и не стоят того, чтобы ради них создавать специализированный синтаксис.

И после таких вот подготовок переходим к самому важному - как же теперь внедрить тип с использованием тэга.
Это сделать достаточно просто:
```Swift
container.register(Home.init)
    .injection { $0.animal1 = by(tag: Felix.self, on: $1) }
    .injection(\.animal2) { by(tag: Rex.self, on: $0) }
```
Или даже так:
```Swift
container.register { 
    Home(animal1: by(tag: Felix.self, on: $0),
         animal2: by(tag: Rex.self, on: $1))
}
```
Или так:
```Swift
let animal1: Animal = by(tag: Felix.self, on: container.resolve())
let animal2: Animal = by(tag: Rex.self, on: container.resolve())
```
Как видим, модификатор внедрения универсален, и может быть использован с любым другим синтаксисом. Правда к нему нужно привыкать, так как выглядит такая конструкция больше как магия, как нечто реальное.

Во всех трех случаях, в animal1 будет лежать экземпляр класса Cat, а в animal2 будет лежать экземпляр класса Dog.

## Множественное внедрение
Более простой, и понятный модификатор внедрения - это множественное внедрение. Он позволяет внедрить массив объектов соответствующих некоему сервису. Пример, когда подобное может понадобиться: Есть протокол который позволяет получить количество новых уведомлений/новостей/сообщений/задач - ну или просто количество чего-то нового.
Для получения подобной информации каждый раздел, будет иметь свою собственную реализацию, и лазить по разным методам на сервер, а возможно брать из БД. Соответственно удобно если каждый раздел реализует этот один протокол. Но как собрать в этом случае все эти цифры вместе, чтобы показать на badge общее количество нового?

При использовании различных библиотек, вам бы пришлось или указывать явно типы всех разделов, или добавлять тэги, но не удалось бы получить все объекты соответствующие одному протоколу. В DITranquillity это делает очень легко:
```Swift
container.register(EventsService.self)
    .as(NewCounter.self)
container.register(NewsService.self)
    .as(NewCounter.self)
container.register(MessagesService.self)
    .as(NewCounter.self)
container.register(TasksService.self)
    .as(NewCounter.self)
...

let anyCounters: [NewCounter] = many(container.resolve())
```
или, как и в случае с тэгами модификатор можно использовать во всех ситуациях:
```Swift
container.register { BadgeUpdater(anyCounters: many($0)) }
// или
container.register(BadgeUpdater.init)
.injection(\.anyCounters) { many($0) }
```

Таким не хитрым способом, можно получать все объекты соответствующие некоему сервису.

## Аргумент
Последний модификатор внедрения, это внедрение аргумента. Но прежде чем рассказать о нем, обращаю внимание - это не безопасное API, и если тип аргумента внедряемого, не совпадет с типом аргумента желаемым, то библиотека может упасть  во время исполнения, с информацией, какой тип не удалось получить.
Но если вы уверены в своих силах, то давайте разбираться, как этим пользоваться. Для того чтобы в компонент можно было внедрять аргументы, как и в прошлых случаях достаточно указать модификатор внедрения:
```Swift
container.register { Cat(name: arg($0)) }
.injection { $0.owner = arg($1) }
.injection(\.age) { arg($0) }
```
Да аргументы можно передавать в любое место, а не только непосредственно в метод инициализации. Дальше обращаю внимание, что их количество может быть любым. В данном примере мы будем передавать три аргумента. При передаче важен порядок - он интуитивен - в каком порядке встречается `arg` в таком порядке надо будет и передавать аргументы.

Следующая важная особенность. В отличии от наверное всех библиотек для внедрения зависимостей, в DITranquillity аргументы могут передаваться не только на первый получаемый объект, но и на любой объект который создается в ходе создания целевого. Это было сделано для того чтобы при получении ViewController-а можно было передать аргументы сразу в Presenter. Удобно? - Да. Безопасно? - Не очень, так как зависимости являются внутренней информацией объекта.
Как же это сделать? Для этого у библиотеки есть такой раздел как "расширения". В дальнейшем расширений будет больше, но пока они позволяют добавить аргументы к любому объекту при следующем его создании. В коде это выглядит так:
```Swift
container.extensions(for: Cat.self).setArgs("Felix", "Peter", 2)
```
Вначале мы получаем экземпляр расширения для некоего типа. То есть указываем желание, что хотим для некоторого типа добавить дополнительное поведение на этапы его создания.

После этого для этого типа передаем аргументы. Как я писал выше - порядок и тип аргументов никак не проверяется на этапе компиляции, только во время исполнения.

Аргументы будут переданы только на ОДНУ следующую инициализацию. 

Существует более безопасный, и более красивый способ передачи аргументов - воспользоваться [отложенным внедрением](delayed_injection.md). Подробно про него написано на [странице](delayed_injection.md), тут будет лишь небольшой пример:
```Swift
class Home {
    let catMaker: Provider3<Cat, String, String, Int>
    init(catMaker: Provider3<Cat, String, String, Int>) {
        self.catMaker = catMaker
    }
    ...
    func makeCat(name: String, owner: String, age: Int) -> Cat {
        return catMaker.value(name, owner, age)
    }
}
```
В этом примере используется тесная интеграция с отложенным внедрением. В класс дома внедряется специальный объект, который позволяет создавать кошку отложено. Такой способ чуть более безопасней, чем использование расширений, но и менее гибкий.


