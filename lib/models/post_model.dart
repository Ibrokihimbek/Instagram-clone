import 'package:instagram_clone/models/post_comment.dart';

class PostModel {
  String userName;
  String title;
  String userLogo;
  List<String> images = [];
  bool isLiked;
  bool isBookMarked;
  int likeCount = 0;
  List<PostComment> comments = [];
  int imageIndicator = 0;
  bool isTitleExpanded = false;

  PostModel({
    required this.userName,
    required this.title,
    required this.userLogo,
    required this.images,
    required this.isLiked,
    required this.isBookMarked,
    required this.comments,
    this.likeCount = 0,
  });

  static String baseUrl = "https://xsgames.co/randomusers/assets/avatars/male/";

  static final posts = [
    PostModel(
        userName: "jack",
        title:
            "Temporary grants have let Arizona schools make incremental gains to address inadequate ratios of campus mental health professionals to students. But as youth mental health issues persist, the state lacks a permanent solution.",
        userLogo: "https://i.pravatar.cc/300?img=7",
        images: [
          "https://i.pravatar.cc/300?img=1",
          "https://i.pravatar.cc/300?img=2",
          "https://i.pravatar.cc/300?img=5",
          "https://i.pravatar.cc/300?img=9",
        ],
        isLiked: false,
        isBookMarked: false,
        likeCount: 101,
        comments: []),
    PostModel(
        userName: "camila",
        title:
            "A national epicenter for Valley fever infections, Arizona gets first major state funding boost in 15 years",
        userLogo: "https://i.pravatar.cc/300?img=36",
        images: [
          "https://i.pravatar.cc/300?img=10",
          "https://i.pravatar.cc/300?img=16",
          "https://i.pravatar.cc/300?img=19",
          "https://i.pravatar.cc/300?img=20",
        ],
        isLiked: false,
        isBookMarked: false,
        likeCount: 201,
        comments: [
          PostComment(
            "jack",
            "https://i.pravatar.cc/300?img=7",
            "Hello",
          ),
          PostComment(
            "camila",
            "https://i.pravatar.cc/300?img=7",
            "How are you",
          ),
        ]),
    PostModel(
      userName: "Waggles",
      title:
          "Repeat safety violations, critical resource shortages put Arizona dialysis patients at heightened risk",
      userLogo: "https://i.pravatar.cc/300?img=8'",
      images: [
        "https://i.pravatar.cc/300?img=21",
        "https://i.pravatar.cc/300?img=23",
        "https://i.pravatar.cc/300?img=24",
        "https://i.pravatar.cc/300?img=26",
      ],
      isLiked: false,
      isBookMarked: false,
      likeCount: 301,
      comments: [],
    ),
    PostModel(
      userName: "Cherine",
      title:
          "Patient deaths at Arizona State Hospital raise questions about staffing levels, lack of oversight",
      userLogo: "https://i.pravatar.cc/300?img=9",
      images: [
        "https://i.pravatar.cc/300?img=28",
        "https://i.pravatar.cc/300?img=31",
        "https://i.pravatar.cc/300?img=36",
        "https://i.pravatar.cc/300?img=37",
      ],
      isLiked: false,
      isBookMarked: false,
      likeCount: 401,
      comments: [],
    ),
    PostModel(
      userName: "Jorj_007",
      title:
          "State leaders’ decade of neglect imperiled fragile child care system. The pandemic nearly made it collapse.",
      userLogo: "https://i.pravatar.cc/300?img=11",
      images: [
        "https://i.pravatar.cc/300?img=38",
        "https://i.pravatar.cc/300?img=39",
        "https://i.pravatar.cc/300?img=40",
        "https://i.pravatar.cc/300?img=41",
      ],
      isLiked: false,
      isBookMarked: false,
      likeCount: 501,
      comments: [],
    ),
    PostModel(
      userName: "Alina",
      title:
          "Public information lacking as COVID-19 surges in Arizona classrooms",
      userLogo: "https://i.pravatar.cc/300?img=10",
      images: [
        "https://i.pravatar.cc/300?img=42",
        "https://i.pravatar.cc/300?img=43",
        "https://i.pravatar.cc/300?img=44",
        "https://i.pravatar.cc/300?img=45",
      ],
      isLiked: false,
      isBookMarked: false,
      likeCount: 601,
      comments: [],
    ),
    PostModel(
      userName: "James",
      title:
          "History of rejected Arizona ballots creates further election uncertainty Election officials didn’t count 27,327 ballots cast by Arizona voters in the November election",
      userLogo: "https://i.pravatar.cc/300?img=15",
      images: [
        "https://i.pravatar.cc/300?img=46",
        "https://i.pravatar.cc/300?img=47",
        "https://i.pravatar.cc/300?img=48",
        "https://i.pravatar.cc/300?img=49",
      ],
      isLiked: false,
      isBookMarked: false,
      likeCount: 121,
      comments: [
        PostComment(
          "Alina",
          "https://i.pravatar.cc/300?img=10",
          "Goog",
        ),
        PostComment(
          "james",
          "https://i.pravatar.cc/300?img=15",
          "Tahnk you",
        ),
      ],
    ),
    PostModel(
        userName: "Andrey",
        title:
            "Outbreaks, quarantines and closures: Help AZCIR track COVID-19 in Arizona schools",
        userLogo: "https://i.pravatar.cc/300?img=12",
        images: [
          "https://i.pravatar.cc/300?img=50",
          "https://i.pravatar.cc/300?img=51",
          "https://i.pravatar.cc/300?img=52",
          "https://i.pravatar.cc/300?img=53",
        ],
        isLiked: false,
        isBookMarked: false,
        likeCount: 155,
        comments: []),
    PostModel(
        userName: "Benjamin",
        title:
            "COVID-19 cases surge among American Airlines ramp employees at Sky Harbor by Brandon Quester and Jude Joffe-Block",
        userLogo: "https://i.pravatar.cc/300?img=65",
        images: [
          "https://i.pravatar.cc/300?img=54",
          "https://i.pravatar.cc/300?img=55",
          "https://i.pravatar.cc/300?img=56",
          "https://i.pravatar.cc/300?img=57",
        ],
        isLiked: false,
        isBookMarked: false,
        likeCount: 265,
        comments: []),
    PostModel(
        userName: "William",
        title:
            "Few Joe Arpaio immigrant victims claim unlawful detention compensation Former Sheriff Joe Arpaio defied a federal court order by allowing his deputies to nab scores of immigrants.",
        userLogo: "https://i.pravatar.cc/300?img=63",
        images: [
          "https://i.pravatar.cc/300?img=58",
          "https://i.pravatar.cc/300?img=59",
          "https://i.pravatar.cc/300?img=60",
          "https://i.pravatar.cc/300?img=61",
        ],
        isLiked: false,
        isBookMarked: false,
        likeCount: 666,
        comments: []),
  ];
}
