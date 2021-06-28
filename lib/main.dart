import 'package:flutter/material.dart';
import 'package:xl/data.dart';
import 'package:xl/detail.dart';
import 'package:xl/textShow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '香料大全',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('香料大全'),
        ),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/xl.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _buildUI(xlDataFromJson(snapshot.data));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        drawer: DrawerOnly(),
      ),
    );
  }

  Widget _buildUI(List<XLData> data) {
    return SafeArea(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7
          ),
          itemBuilder: (context, index) {
            return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailView(
                            number: index,
                            imageName: 'assets/$index.jpeg',
                            data: data[index],
                          )
                      )
                  );
                },
                child: Column(
                  children: [
                    Hero(
                      tag: 'image$index',
                      child: Image.asset(
                        'assets/$index.jpeg',
                        height: constraints.maxWidth,
                        width: constraints.maxWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      data[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              );
            });
          }),
    );
  }
}


class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('香料的属性和应用'),
            trailing: Icon(Icons.arrow_forward_ios, size: 15,),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ShowView(
                      data: '## 1.八角\n'
                          '也称大茴香、大料，香味比较浓郁，有点甜味，适合大多数食材，比较万能。熬酱、卤菜、烧菜、都适合，也是五香粉、咖喱粉的主要香料之一。（出味快，香味浓，用量通常较小)'
                          '\n## 2. 桂皮\n'
                          '也称肉桂。香味浓郁，味道有些甜、辣，和八角一样，也属于万能香料。（主要是增香，不可过大）'
                          '\n## 3. 香叶\n'
                          '也称月桂叶。百搭，亲和力强，炖肉可以加一片，调制卤水每一斤水对应加一片。（用量不能太多，否则会有苦味）'
                          '\n## 4. 丁香\n'
                          '若想骨里香，就得放丁香。长得像一个小钉子，也属于百搭香料，它的香味非常浓烈。（用量不可过多，否则药味过重）'
                          '\n## 5. 黄栀子、紫草、红曲米\n'
                          '属于染色的香料，可以让卤水呈红色，与酱油搭配，可以给赋予食材漂亮的酱红色。（可以提前用水煮出颜色调色用）'
                          '\n## 6. 甘草\n'
                          '最大的特点就是甘甜，一种不同于糖的甜味，可以让卤水的甜味更复合，据说有防腐的功效。'
                          '\n## 7. 肉豆蔻\n'
                          '辣辣的，香味强烈，五香牛肉、樟茶鸭、潮汕卤味喜用，广东师傅用得比较多，卤肉可以来两粒。（味道比较冲，用量不宜过大）'
                          '\n## 8. 小茴香\n'
                          '香味比较温和，带有类似樟脑的香味，尝起来微甜微苦，味道比八角轻一些。（味道比较轻淡，通常用量较大）'
                          '\n## 9. 草果\n'
                          '有较强的去腥除异的作用，可以增加香味，拍碎来用，特别适合牛羊肉，羊肉汤来一粒，奇香。(适合比较油腻的食材，油脂少的需少放）'
                          '\n## 10. 白芷\n'
                          '除异去腥效果好，适合炖鱼、羊使用。（味道较淡，一般用量较大）'
                          '\n## 11. 山奈\n'
                          '又称沙姜，非常好的一种除腥臭异味的香料，适合异味比较大的食材。（根据食材来调整用量）'
                          '\n## 12. 陈皮\n'
                          '添香去腥解腻，适合鸡肉，著名菜肴有陈皮鸡。（用量不可过大，会出苦味）'
                          '\n## 13. 姜黄\n'
                          '增香添味。广东师傅爱用，是咖喱粉的配料之一，能够赋予食材金黄色的色泽。'
                          '\n## 14. 胡椒\n'
                          '白胡椒黑胡椒其实是一个东西，只不过生长周期不同，白胡椒是脱过皮的。作用就是增香除异，微微辣味，熬汤可以加入一两粒胡椒，效果很好。'
                          '\n## 15. 辣椒\n'
                          '不同辣椒有不同的作用，有出辣味、有的出香味、有的出香味。'
                          '\n## 16. 花椒\n'
                          '出麻味出香味，熬油卤菜炒菜均可，炒菜需要爆香后择出，避免影响口感。四川人煨汤喜欢给一两粒。',
                      title: '香料的属性和应用')
                  )
              );
            },
          ),
          ListTile(
            title: Text('香料的使用技巧'),
            trailing: Icon(Icons.arrow_forward_ios, size: 15,),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ShowView(
                      data: '## 1. 使用香料得宁少勿多。\n'
                          '一些苦香类的香料用多了容易让卤水有较重的苦味药味，容易夺了身材本身的味道。'
                          '\n## 2. 香料要提前用冷水泡一下。\n'
                          '香料本身会有一些异味和苦味，我们可以用冷水浸泡一下祛除，对于异味较大的香料，可以加入少许白酒。'
                          '\n## 3.香料最好装袋下锅。\n'
                          '卤菜时，香料在卤的过中还会持续的渗出味道，时间过久可能会导致香料味太重，所以用香料包装好，味道足够就捞出，不够再放入即可，比较灵活。'
                          '\n## 4.香料一般没有固定的使用量。\n'
                          '不同香料有不同的特性，同种香料品质不同香味的弄到也是不一样的所以我们更得学会灵活增添。'
                          '\n## 5.香料要用油煸炒一下\n'
                          '因为香料中的很多香味成份是脂溶性的，一定得用油提取出香味。炒至的过程中一定得小火低油温，炒至卤料微黄即可。'
                          '\n## 6.不同食材对应的不同香料。\n'
                          '加工羊肉适合加入一些孜然，猪肉要多一些肉蔻、桂皮。鸡鸭禽类适合沙姜和白芷，还有丁香也特别适合，卤出来骨头里的汁特别香。比较腥的内脏、肥肠、腰子这些，多一些草果、沙姜、白芷、荜拨，除去异味。'
                          '\n## 7.五香粉、十三香的使用\n'
                          '五香粉、十三香具体就是把若干香料按照比列烘香磨成粉，出味快容易发黑，炒菜的时候起锅来一小勺可以增香。但烧菜和卤菜时需要注意用量，时间一久容易发黑。',
                      title: '香料的使用技巧')
                  )
              );
            },
          ),
          ListTile(
            title: Text('素菜和调味料搭配'),
            trailing: Icon(Icons.arrow_forward_ios, size: 15,),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ShowView(
                    data: '## 1. 炒空心菜的时候，要用好多好多蒜\n'
                        '无论清炒、腐乳炒、虾酱炒，空心菜离不了蒜。热锅冷油爆香蒜末，先入菜梗，再放菜叶，炒出来的空心菜才有灵魂。最重要的是，蒜末的量不能少。'
                        '一把大约7、8两的空心菜，我会配5、6瓣蒜，比轻轻浅浅地两颗蒜头炒出来的空心菜好吃太多。'
                        '\n## 2. 基本法规定，蒜蓉豆豉酱要炒出香气\n'
                        '无论是做豉汁蒸排骨，或是蒜豉鸡，或者只是简单地炒个肉，蒜蓉和豆豉这个固定班底简直随处可见。蒜瓣切碎成蒜末，豆豉略略泡水之后，就可以直接用了吗？当然不是。'
                        '蒜蓉豆豉用热锅冷油小火翻炒出香味，这个酱料才是合格的，和没有炒过的蒜蓉豆豉不是一个世界的东西。注意火力不能大，蒜蓉非常容易糊。油要多一点，蒜蓉和豆豉的香气比较能出来。'
                        '\n## 3. 用洋葱配菜的时候，请勇敢地把它炒焦\n'
                        '洋葱也是用得非常多的配料，在菜谱里，特别提出一个小技巧是把洋葱炒焦。这是因为富含糖分和蛋白质的食材，在加热到一定温度后，会产生「美拉德反应」，能让食材上色，并且产生香气。'
                        '洋葱就是典型的容易产生美拉德反应的食材之一，炒到焦黄的洋葱不止香，而且极甜。'
                        '唯一有一点困难的是，如果用大量的洋葱做配菜时，因为洋葱出水比较多，会需要非常长的时间才能把它炒到焦黄。但是当只需要少量洋葱的时候，请记住这个小技巧。 '
                        '\n## 4. 用一点鸡油，菇类既鲜且润\n'
                        '鸡油和蘑菇这对CP知道的人不多，其实它们很配。在焖花菇的时候，用一小块鸡油或一大块鸡皮和花菇一起煮，用一点点油脂给予干蘑菇充分的润滑，蘑菇的鲜美就变得不再干涩了。',
                    title: '素菜和调味料搭配')
                )
              );
            },
          ),
        ],
      ),
    );
  }
}

