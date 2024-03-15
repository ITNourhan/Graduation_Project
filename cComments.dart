import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CommentsPage(),
  ));
}

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Comment> comments = [
    Comment(
      username: 'هالة محمد',
      comment: 'منشور رائع!',
      liked: false,
      likesCount: 10,
    ),
    Comment(
      username: 'سناء علي',
      comment: 'أحبه ❤️',
      liked: true,
      likesCount: 25,
    ),
    Comment(
      username: 'مريم أحمد',
      comment: 'لا حول ولا قوة إلا بالله. يجب أن تشعري بأنك لست وحدك، الجميع يقف معك ويدعمك في هذه المحنة. تذكري أن القوة تأتي من الداخل، وستتجاوزين هذا الأمر بنجاح.',
      liked: false,
      likesCount: 17,
    ),
    Comment(
      username: 'علياء أحمد',
      comment: 'الكثير من الناس يمرون بتجارب مماثلة ويعلمون ما تشعرين به. ابقي قوية وثقي في أن هناك دعمًا ومساعدة متاحة لك.',
      liked: true,
      likesCount: 30,
    ),
    Comment(
      username: 'منار مجدي',
      comment: 'يجب عليك البحث عن الدعم والمساعدة اللازمة من الأهل والأصدقاء والسلطات المحلية. لا تخجلي من طلب المساعدة، فهناك أشخاص يريدون مساعدتك.',
      liked: false,
      likesCount: 22,
    ),
    Comment(
      username: 'نورهان عادل',
      comment: 'لا يمكن لأحد أن يحكم عليك أو يلومك على ما حدث. عليك فقط أن تركزي على الشفاء والتعافي. كني قوية وأبقي متفائلة.',
      liked: true,
      likesCount: 20,
    ),
    Comment(
      username: 'سارة محمد',
      comment: 'هذا أمر محزن جدًا. يجب عليك أن تعرفي أنك لست وحدك، وأن هناك دعمًا متاحًا لك من الأصدقاء والأهل والمجتمع.',
      liked: false,
      likesCount: 15,
    ),
    Comment(
      username: 'هنا أحمد',
      comment: 'أنا آسف لما حدث لك. تذكري أنك قوية وقادرة على تجاوز هذا الأمر. نحن هنا لدعمك في أي وقت.',
      liked: true,
      likesCount: 35,
    ),
    Comment(
      username: 'فاطمة خالد',
      comment: 'قومي بالابلاغ عن الحساب المسيء فورًا، ولا تترددي في طلب المساعدة من الشرطة أو الجهات المعنية. الخيانة الالكترونية جريمة ويجب معاقبة المتسبب فيها.',
      liked: false,
      likesCount: 18,
    ),
    Comment(
      username: 'نور علي',
      comment: 'هذا أمر مؤلم للغاية. عليك الاتصال بالسلطات المحلية أو الشرطة فورًا والابلاغ عن هذا النوع من السلوك غير القانوني.',
      liked: true,
      likesCount: 28,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Stack(
            children: [
              AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: null,
                title: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'التعليقات',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          fontSize: 18,
                          color: Color(0xff3A5985),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_sharp, color: Color(0xff3A5985), size: 20,),
                    onPressed: () {

                    },
                  ),
                ],
              ),
              Positioned(
                top: kToolbarHeight,
                left: 0,
                right: 0,
                child: Divider(
                  height: 1,
                  thickness: 2,
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              ...comments.map((comment) => _buildComment(comment)).toList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddCommentDialog(context);
          },
          child: Icon(Icons.add, color: Color(0xff618FCA),),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildComment(Comment comment) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text(comment.username[0]),
              ),
              SizedBox(width: 16),
              Text(
                comment.username,
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Almarai'),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            comment.comment,
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontFamily: 'Almarai'),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  comment.liked ? Icons.favorite : Icons.favorite_border,
                  color: comment.liked ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    comment.liked = !comment.liked;
                    if (comment.liked) {
                      comment.likesCount++;
                    } else {
                      comment.likesCount--;
                    }
                  });
                },
              ),
              Text('${comment.likesCount} إعجاب', style: TextStyle(fontFamily: 'Almarai')),
            ],
          ),
        ],
      ),
    );
  }

  void _showAddCommentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'إضافة تعليق',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'Almarai',
              color: Color(0xff3A5985),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'أكتب تعليقك',
                    hintStyle: TextStyle(
                      fontFamily: 'Almarai',
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

              },
              child: Text(
                'إلغاء',
                style: TextStyle(
                  fontFamily: 'Almarai',
                  color: Color(0xff618FCA),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _showConfirmationMessage();
                Navigator.of(context).pop();
              },
              child: Text(
                'إضافة',
                style: TextStyle(
                  fontFamily: 'Almarai',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff618FCA),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تمت إضافة التعليق بنجاح'),
        duration: Duration(seconds: 2),
        closeIconColor: Colors.white30,
      ),
    );
  }
}

class Comment {
  final String username;
  final String comment;
  bool liked;
  int likesCount;

  Comment({
    required this.username,
    required this.comment,
    this.liked = false,
    this.likesCount = 0,
  });
}
