// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_ingles_devs/data/model/questions_model.dart';
import 'package:flutter_ingles_devs/repository/inges_dev_api.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_ingles_devs/main.dart';

void main() {
  test("Probar Api", () async{
    final json = [
      {
        "id": 36,
        "question": "_____ expensive is it to learn Python?",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:00:32.237",
        "update_at": "2024-05-07T18:00:32.237",
        "answers": [
          {
            "id": 144,
            "answer": "Why\"",
            "fk_question": 36,
            "iscorrect": false,
            "create_at": "2024-05-07T18:00:32.237",
            "update_at": "2024-05-07T18:00:32.237"
          }
        ]
      },
      {
        "id": 12,
        "question": "I call tech support ____ my laptop freezes.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 100,
        "create_at": "2024-05-07T17:57:22.087",
        "update_at": "2024-05-07T17:57:22.087",
        "answers": [
          {
            "id": 45,
            "answer": "When\"",
            "fk_question": 12,
            "iscorrect": true,
            "create_at": "2024-05-07T17:57:22.087",
            "update_at": "2024-05-07T17:57:22.087"
          }
        ]
      },
      {
        "id": 43,
        "question": "Be careful _____ your CPU.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:02:31.750",
        "update_at": "2024-05-07T18:02:31.750",
        "answers": [
          {
            "id": 171,
            "answer": "overclock\"",
            "fk_question": 43,
            "iscorrect": false,
            "create_at": "2024-05-07T18:02:31.750",
            "update_at": "2024-05-07T18:02:31.750"
          }
        ]
      },
      {
        "id": 25,
        "question": "I’m not sure about the party this Friday. I ____ home.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T17:59:05.620",
        "update_at": "2024-05-07T17:59:05.620",
        "answers": [
          {
            "id": 99,
            "answer": "will stay\"",
            "fk_question": 25,
            "iscorrect": false,
            "create_at": "2024-05-07T17:59:05.620",
            "update_at": "2024-05-07T17:59:05.620"
          }
        ]
      },
      {
        "id": 65,
        "question": "I hope my team _____ clear documentation.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:04:28.027",
        "update_at": "2024-05-07T18:04:28.027",
        "answers": [
          {
            "id": 259,
            "answer": "will writes\"",
            "fk_question": 65,
            "iscorrect": false,
            "create_at": "2024-05-07T18:04:28.027",
            "update_at": "2024-05-07T18:04:28.027"
          }
        ]
      },
      {
        "id": 5,
        "question": "A: I use two monitors.  <br>B: _____",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 100,
        "create_at": "2024-05-07T17:56:27.000",
        "update_at": "2024-05-07T17:56:27.000",
        "answers": [
          {
            "id": 17,
            "answer": "I do too.\"",
            "fk_question": 5,
            "iscorrect": true,
            "create_at": "2024-05-07T17:56:27.000",
            "update_at": "2024-05-07T17:56:27.000"
          }
        ]
      },
      {
        "id": 8,
        "question": "I’d like ____ my English.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 100,
        "create_at": "2024-05-07T17:56:54.537",
        "update_at": "2024-05-07T17:56:54.537",
        "answers": [
          {
            "id": 29,
            "answer": "to perfect\"",
            "fk_question": 8,
            "iscorrect": true,
            "create_at": "2024-05-07T17:56:54.537",
            "update_at": "2024-05-07T17:56:54.537"
          }
        ]
      },
      {
        "id": 41,
        "question":
            "Do you think it’s convenient _____ programming on YouTube?",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:02:18.743",
        "update_at": "2024-05-07T18:02:18.743",
        "answers": [
          {
            "id": 162,
            "answer": "to learning\"",
            "fk_question": 41,
            "iscorrect": false,
            "create_at": "2024-05-07T18:02:18.743",
            "update_at": "2024-05-07T18:02:18.743"
          }
        ]
      },
      {
        "id": 6,
        "question": "A: I work remotely.  <br>B: _____",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 100,
        "create_at": "2024-05-07T17:56:36.313",
        "update_at": "2024-05-07T17:56:36.313",
        "answers": [
          {
            "id": 21,
            "answer": "I do too.\"",
            "fk_question": 6,
            "iscorrect": true,
            "create_at": "2024-05-07T17:56:36.313",
            "update_at": "2024-05-07T17:56:36.313"
          }
        ]
      },
      {
        "id": 51,
        "question": "My mentor _____ me about this type of error.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:03:10.767",
        "update_at": "2024-05-07T18:03:10.767",
        "answers": [
          {
            "id": 203,
            "answer": "warning\"",
            "fk_question": 51,
            "iscorrect": false,
            "create_at": "2024-05-07T18:03:10.767",
            "update_at": "2024-05-07T18:03:10.767"
          }
        ]
      },
      {
        "id": 53,
        "question": "I have a professional _____ my phone battery.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:03:19.457",
        "update_at": "2024-05-07T18:03:19.457",
        "answers": [
          {
            "id": 209,
            "answer": "replace\"",
            "fk_question": 53,
            "iscorrect": true,
            "create_at": "2024-05-07T18:03:19.457",
            "update_at": "2024-05-07T18:03:19.457"
          }
        ]
      },
      {
        "id": 50,
        "question":
            "I _____ all my money on stock the day before they went bankrupt.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:03:06.560",
        "update_at": "2024-05-07T18:03:06.560",
        "answers": [
          {
            "id": 199,
            "answer": "did invest\"",
            "fk_question": 50,
            "iscorrect": false,
            "create_at": "2024-05-07T18:03:06.560",
            "update_at": "2024-05-07T18:03:06.560"
          }
        ]
      },
      {
        "id": 57,
        "question":
            "If I _____ my credit card, I would immediately call the bank.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:03:38.513",
        "update_at": "2024-05-07T18:03:38.513",
        "answers": [
          {
            "id": 228,
            "answer": "would lose\"",
            "fk_question": 57,
            "iscorrect": false,
            "create_at": "2024-05-07T18:03:38.513",
            "update_at": "2024-05-07T18:03:38.513"
          }
        ]
      },
      {
        "id": 37,
        "question": "Do you know _____ a security camera?",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:00:37.773",
        "update_at": "2024-05-07T18:00:37.773",
        "answers": [
          {
            "id": 147,
            "answer": "install\"",
            "fk_question": 37,
            "iscorrect": false,
            "create_at": "2024-05-07T18:00:37.773",
            "update_at": "2024-05-07T18:00:37.773"
          }
        ]
      },
      {
        "id": 28,
        "question": " _____ turn is it to make coffee?",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T17:59:36.440",
        "update_at": "2024-05-07T17:59:36.440",
        "answers": [
          {
            "id": 111,
            "answer": "When\"",
            "fk_question": 28,
            "iscorrect": false,
            "create_at": "2024-05-07T17:59:36.440",
            "update_at": "2024-05-07T17:59:36.440"
          }
        ]
      },
      {
        "id": 74,
        "question": "My colleague asked me _____",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:05:31.963",
        "update_at": "2024-05-07T18:05:31.963",
        "answers": [
          {
            "id": 293,
            "answer": "where I had bought my phone case.\"",
            "fk_question": 74,
            "iscorrect": true,
            "create_at": "2024-05-07T18:05:31.963",
            "update_at": "2024-05-07T18:05:31.963"
          }
        ]
      },
      {
        "id": 39,
        "question": "Do you know _____ the latest edition of this book?",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:00:47.087",
        "update_at": "2024-05-07T18:00:47.087",
        "answers": [
          {
            "id": 153,
            "answer": "where to find\"",
            "fk_question": 39,
            "iscorrect": true,
            "create_at": "2024-05-07T18:00:47.087",
            "update_at": "2024-05-07T18:00:47.087"
          }
        ]
      },
      {
        "id": 13,
        "question": "I never buy ____ strange websites.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 100,
        "create_at": "2024-05-07T17:57:32.740",
        "update_at": "2024-05-07T17:57:32.740",
        "answers": [
          {
            "id": 51,
            "answer": "in\"",
            "fk_question": 13,
            "iscorrect": false,
            "create_at": "2024-05-07T17:57:32.740",
            "update_at": "2024-05-07T17:57:32.740"
          }
        ]
      },
      {
        "id": 3,
        "question": "_____ your high school classmates into technology?",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 100,
        "create_at": "2024-05-07T17:56:15.120",
        "update_at": "2024-05-07T17:56:15.120",
        "answers": [
          {
            "id": 12,
            "answer": "Did\"",
            "fk_question": 3,
            "iscorrect": false,
            "create_at": "2024-05-07T17:56:15.120",
            "update_at": "2024-05-07T17:56:15.120"
          }
        ]
      },
      {
        "id": 32,
        "question": "If you need to send an email, you _____ use my laptop",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:00:11.960",
        "update_at": "2024-05-07T18:00:11.960",
        "answers": [
          {
            "id": 127,
            "answer": "might\"",
            "fk_question": 32,
            "iscorrect": false,
            "create_at": "2024-05-07T18:00:11.960",
            "update_at": "2024-05-07T18:00:11.960"
          }
        ]
      },
      {
        "id": 55,
        "question": "If I had a million dollars, I____ 34 Bitcoins.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T18:03:29.707",
        "update_at": "2024-05-07T18:03:29.707",
        "answers": [
          {
            "id": 217,
            "answer": "would buy\"",
            "fk_question": 55,
            "iscorrect": true,
            "create_at": "2024-05-07T18:03:29.707",
            "update_at": "2024-05-07T18:03:29.707"
          }
        ]
      },
      {
        "id": 24,
        "question":
            "A: Can you give me directions to the State University? <br>B: Sure, it’s really close, just ____ two blocks. It’s on your left. ",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T17:58:59.873",
        "update_at": "2024-05-07T17:58:59.873",
        "answers": [
          {
            "id": 93,
            "answer": "go ahead\"",
            "fk_question": 24,
            "iscorrect": true,
            "create_at": "2024-05-07T17:58:59.873",
            "update_at": "2024-05-07T17:58:59.873"
          }
        ]
      },
      {
        "id": 22,
        "question": "Drive straight, when you get to the corner____",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T17:58:48.410",
        "update_at": "2024-05-07T17:58:48.410",
        "answers": [
          {
            "id": 88,
            "answer": "spin right\"",
            "fk_question": 22,
            "iscorrect": false,
            "create_at": "2024-05-07T17:58:48.410",
            "update_at": "2024-05-07T17:58:48.410"
          }
        ]
      },
      {
        "id": 9,
        "question": "I ____ get a remote job.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 100,
        "create_at": "2024-05-07T17:57:00.687",
        "update_at": "2024-05-07T17:57:00.687",
        "answers": [
          {
            "id": 35,
            "answer": "wanting\"",
            "fk_question": 9,
            "iscorrect": false,
            "create_at": "2024-05-07T17:57:00.687",
            "update_at": "2024-05-07T17:57:00.687"
          }
        ]
      },
      {
        "id": 29,
        "question": "____ computer is this? It’s making a lot of noise.",
        "type": "complete",
        "rightScore": 100,
        "wrongScore": 0,
        "create_at": "2024-05-07T17:59:55.590",
        "update_at": "2024-05-07T17:59:55.590",
        "answers": [
          {
            "id": 113,
            "answer": "Whose\"",
            "fk_question": 29,
            "iscorrect": true,
            "create_at": "2024-05-07T17:59:55.590",
            "update_at": "2024-05-07T17:59:55.590"
          }
        ]
      }
    ];
    final res = await IngesDevApi.test().calificar(13, json.map((e) => QuestionsModel.fromMap(e)).toList());
    expect(res, true);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
