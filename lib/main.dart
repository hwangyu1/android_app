import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SayingsApp());
}

class SayingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '속담 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SayingsScreen(),
    );
  }
}

class SayingsScreen extends StatefulWidget {
  @override
  _SayingsScreenState createState() => _SayingsScreenState();
}

class _SayingsScreenState extends State<SayingsScreen> {
  final List<Saying> sayings = [
    Saying(
      proverb: "호랑이도 제 말 하면 온다",
      meaning: "말이 중요하다는 뜻",
      origin:
      "한국에서는 호랑이 얘기를 하면 호랑이가 나타난다는 말에 유래해서 호랑이도 제말하면 온다더니라는 얘기가 나왔고, 미국에서는 악마 devil에 대해 얘기하면 악마가 나타난다는 미신에서 speak of the devil이라는 표현이 나왔다고 합니다.",
    ),
    Saying(
      proverb: "말 한마디에 천냥 빚을 갚는다",
      meaning: "말에 대한 책임이 크다는 뜻",
      origin:
      "옛날에 한 사람이 많은 사람에게 돈을 빚지고 살았습니다. 어느 날 돈을 갚을 기회가 찾아왔지만 돈을 빚진 사람은 말로만 갚을 수 있을 정도로 가난했습니다. 그럼에도 불구하고 그 사람은 약속한 대로 말로 돈을 갚았고, 사람들은 그의 신실함과 책임감을 높이 평가했습니다.",
    ),

    Saying(
    proverb: "고래 싸움에 새우 등 터진다",
    meaning: "큰 일이 벌어지는 사이에 작은 일이 무시될 수 있다는 뜻",
    origin: "옛날에 한 고래와 새우가 싸움을 벌였습니다. 싸움 속에서 고래와 새우 사이에 있던 등만 터져 나왔고, 사람들은 큰 일이 벌어질 때 작은 일은 중요하지 않게 여겨진다는 교훈을 얻었습니다.",
    ),

    Saying(
    proverb: "똑똑하다고 배보다 배꼽이 크다",
    meaning: "무리한 행동으로 불리한 결과를 초래할 수 있다는 뜻",
    origin: "한때 배에 담을 수 있는 양보다 더 많은 양의 물건을 배꼽에 담으려는 사람이 있었습니다. 하지만 배꼽은 배보다 작아서 모든 물건을 담을 수 없었고, 사람들은 무리한 행동은 불리한 결과를 초래한다는 교훈을 얻었습니다.",
    ),

    Saying(
      proverb: "개천에서 용 난다",
      meaning: "뜻밖에 큰 일이 일어난다는 뜻",
      origin:
      "개천(溪川)은 작은 개울을 뜻하고 용은 큰 용을 뜻합니다. 작은 개천에서는 보통 용이 태어나지 않지만, 뜻밖의 일이 일어나서 큰 용이 나타난다는 의미로 사용됩니다.",
    ),
    Saying(
      proverb: "백지장도 맞들면 낫다",
      meaning: "협력하면 더 좋은 결과를 얻을 수 있다는 뜻",
      origin:
      "백지장은 작은 종이 조각을 의미하며, 맞들면 여러 장을 이어붙일 수 있습니다. 협력하고 함께 노력하면 더 큰 성과를 이룰 수 있다는 의미로 사용됩니다.",
    ),
    Saying(
      proverb: "눈코 뜰 새 없다",
      meaning: "바쁘고 정신없다는 뜻",
      origin:
      "눈과 코는 사람이 가장 빨리 움직이는 부위이며, 뜰 새가 없다는 것은 바쁘고 정신없이 움직인다는 의미로 사용됩니다.",
    ),
    Saying(
      proverb: "갈수록 태산",
      meaning: "어려움이나 문제가 점점 커진다는 뜻",
      origin:
      "태산은 큰 산을 의미하며, 갈수록 태산은 어려움이 점점 커지는 상황을 비유합니다.",
    ),
    Saying(
      proverb: "떡 줄 사람은 생각 없다",
      meaning: "부당한 요구를 할 때 상대방이 양보할 가능성이 높다는 뜻",
      origin:
      "한국에서 떡은 특별한 음식으로 간주되며, 떡을 받는 것은 좋은 일이라고 여겨집니다. 그래서 떡을 줄 사람은 상대방에 대한 생각 없이도 부당한 요구를 할 수 있다는 의미로 사용됩니다.",
    ),
    Saying(
      proverb: "장님이야 말로 산다",
      meaning: "사회적 지위나 권력이 있는 사람의 말은 중요하다는 뜻",
      origin:
      "장님은 조상이나 현장에서 권력과 존경을 받는 사람을 의미하며, 그러한 사람의 말은 사회에서 더욱 중요하게 여겨집니다.",
    ),
  // 추가적인 속담과 뜻, 유래를 여기에 추가하세요
  ];

  List<Saying> filteredSayings = [];
  Random random = Random();

  @override
  void initState() {
    filteredSayings = sayings;
    super.initState();
  }

  void filterSayings(String keyword) {
    setState(() {
      filteredSayings = sayings.where((saying) {
        return saying.proverb.toLowerCase().contains(keyword.toLowerCase());
      }).toList();
    });
  }

  void _showMeaningAndOriginDialog(BuildContext context, Saying saying) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('뜻과 유래'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('속담: ${saying.proverb}'),
              Divider(thickness: 2), // 더 굵은 수평선 추가
              Text('뜻: ${saying.meaning}'),
              SizedBox(height: 10),
              Text('유래: ${saying.origin}'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  void showRandomSaying() {
    if (filteredSayings.isEmpty) return; // 필터링된 속담이 없을 경우 동작하지 않음

    setState(() {
      final randomIndex = random.nextInt(filteredSayings.length);
      _showMeaningAndOriginDialog(context, filteredSayings[randomIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('속담 목록'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => filterSayings(value),
              decoration: InputDecoration(
                labelText: '검색',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: showRandomSaying, // 랜덤 속담 표시 기능 호출
            child: Text('랜덤 속담 보기'),
          ),
          Divider(), // 버튼 아래에 수평선 추가
          Expanded(
            child: ListView.builder(
              itemCount: filteredSayings.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(filteredSayings[index].proverb),
                      onTap: () {
                        _showMeaningAndOriginDialog(
                            context, filteredSayings[index]);
                      },
                    ),
                    Divider(thickness: 2), // 더 굵은 수평선 추가
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Saying {
  final String proverb;
  final String meaning;
  final String origin;

  Saying({
    required this.proverb,
    required this.meaning,
    required this.origin,
  });
}
