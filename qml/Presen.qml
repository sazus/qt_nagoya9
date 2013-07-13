import QtQuick 2.1
import Qt.labs.presentation 1.0
import "content"
import "content/background"
//import "qrc:/content"
//import "qrc:/content/background"


Presentation {
	id: _root

	// Slide 確認用
	//	(何枚も表示されると後ろのページの確認がめんどいので
	//	 このpropertyにて非表示・表示設定を行う。
	property bool isView    : true

	//backgroundの変更
	property bool isBgView  : true

	//プレゼン設定
	width: 1024
	height: 768
	titleColor : "#005000"	//上部title
	textColor  : "white"	//presen string
	fontFamily     : "M+2P+IPAG"	// RaspberryPiの場合、日本語を設定しないと
	codeFontFamily : "M+2P+IPAG"	//	日本語表示できないよ。

	//背景
	BackgroundSwirls {	visible: isBgView	}

	// プレゼン機能
	SlideCounter { color: "white" }	//スライドのページ表示
	Clock { color: "white" }		//時間表示


	/* Top Page */
	Slide {
		id : _top
		isSlide: isView

		textColor : "#002000"
		centeredText: "Raspberry Piでプレゼンテーション"
		fontScale:1.3

		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 100
			font.pixelSize: parent.baseFontSize
			font.family:  _root.fontFamily
			text: "sazus"
			color: _top.textColor
		}
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			font.pixelSize:  parent.baseFontSize / 2
			font.family:  _root.fontFamily
			text: "Qt名古屋勉強会#9 07/13/2013"
			color: _top.textColor
		}
	}	//

	/* 自己紹介 */
	Slide {
		isSlide: isView
		SliderFrame {}
		title: "自己紹介的な何か"

		content: [
			"名前：さず(@sazus)",
			"職業：会社員",
			"iTron系組み込みなエンジニア\n最近はlinuxの下回りを少々\n( linuxマゾいｗ )",
			"",
			"Qtと出会って1.5年ぐらい？"
		]

		Image {
			source: "../res/profile_pic.png"
			anchors.right : parent.right
			anchors.rightMargin: 100
			fillMode: Image.PreserveAspectFit
		}
	}	//

	/* Agenda */
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "Ａ ｇ ｅ ｎ ｄ ａ"

		content: [
			"これからはプレゼンは持ち歩く時代らしい",
			"qml-presentation-system",
			" download先",
			" qml moduleのmake(っというか、ファイルのコピー)",
			" 使い方",
		]
	}	//

	// これからはプレゼンは持ち歩く時代らしい
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "これからはプレゼンは持ち歩く時代らしい"

		content: [
			"関東Qt勉強会での一幕 →\n\
 名古屋でもRaspiで何かしたい！ →\n\
 やべぇ、仕事デスマーチ！！ →\n\
 とりあえず、名古屋勉強会で	\n\
 Raspiでプレゼンしてみよう。(← いまここ)"
		]

		Image {
			source: "../res/raspi-pre.png"
			y : parent.height / 2
			anchors.centerIn: parent.centerIn
			width: parent.width * 0.5
			height: parent.height * 0.5
		}
	}	//

	// qml-presentation-system 1
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "qml-presentation-system download先"

		content: [
			"gitリポジトリ先",
			" http://qt.gitorious.org/qt-labs/qml-presentation-system",
			" $ git clone git://gitorious.org/qt-labs/qml-presentation-system.git\nにて取得。"
		]

		Image {
			source: "../res/qml-presen-site.png"
			y : parent.height / 2
			anchors.centerIn: parent.centerIn
			width: parent.width * 0.8
			height: parent.height * 0.5
		}
	}	//

	// qml-presentation-system 2
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "qml-presentation-system moduleのmake(1)"
		titleFontSize: fontSize * 0.9 * fontScale	//title長くて収まらなかったorz

		content: [
			"qml-presentation-systemのDirectoryから",
			" QtCreatorにて、presentation.proを選択",
			" プロジェクトはkitの、Qt5(DesktopとRaspberryPiのクロスコンパイラ)を選択",
		]

		Image {
			source: "../res/qt-creator_project.png"	//TODO: QtCreator画像の差し替え
			y : parent.height / 2
			anchors.centerIn: parent.centerIn
			width: parent.width * 0.7
			height: parent.height * 0.7
		}
	}	//

	// qml-presentation-system 3
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "qml-presentation-system moduleのmake(2)"
		titleFontSize: fontSize * 0.9 * fontScale	//title長くて収まらなかったorz

		content: [
			"qml-presentation-systemをコンパイラ毎にmake",
			"Installされる場所",
			" Qt5.1(DeskTopPC : Qt 5.1.０ for Linux 64-bit)の場合",
			"  /Qt5.1.０/gcc_64/qml/Qt/labs/presentation/",
			" Qt5.1(RaspberryPi : miso-ni-qtpi)の場合",
			"  ${SDCard Imageをmountしている先}/usr/local/qt5pi/qml/Qt/labs/presentation\n\
   miso-ni-qtpiなら \n\
   miso-ni-qtpi/bakeqtpi/opt/rasp-pi-rootfs/usr/local/qt5pi/qml/Qt/labs/presentation \n\
 ※ mountしたSDCard image内に入ってしまうので\n
	QtCreatorでは、ビルド→qmake実行を選択して\n
	Makefileをコンソールにてsudoをつけてmakeする。\n
	$ sudo make",
		]
	}	//

	// miso-ni-qtpiって？
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "miso-ni-qtpiって？"

		textColor : "white"
		centeredText: "qt-projectのBeginner's guide \r
to cross-compile Qt5 on RaspberryPi \r
(http://goo.gl/Nqjzc) \n
で紹介されているベークQtパイ \r
(git://gitorious.org/bakeqtpi/bakeqtpi.git)を \r
forkして修正したもの"

		Image {
			source: "../res/raspberry_misoni.png"
			z: -2
			width: parent.width
			height: parent.height
			anchors.centerIn: parent.Center
			opacity: 1
		}
	}	//

	// miso-ni-qtpiって？(2)
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "miso-ni-qtpiって？"

		textColor : "white"
		content: [
			"変更点",
			" SDCard Imageの変更 \r
  Raspbeian2０13-０2-０9-wheezy-raspbian \r
  ⇒ 2０13-０5-25-wheezy-raspbian(最新！) \n",
			" Qt library構成先のリポジトリ変更 \r
  gitorious.org/qtsdk/qtsdk.git or \r
  qt-everywhere-opensource-src-5.1.０.tar.gz \r
  ⇒ git://gitorious.org/qt/qt5.git & tag v5.1.０ 固定 \r",
			" buildに必要なpackageも取ってきてくれる \r
  ⇒ コマンド一つでQt5の環境構築ができちゃう。 \n\n etc",
		]

		Image {
			source: "../res/raspberry_misoni.png"
			z: -2
			width: parent.width
			height: parent.height
			anchors.centerIn: parent.Center
			opacity: 1
		}
	}	//

	// miso-ni-qtpiって？(3)
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "miso-ni-qtpiって？"

		textColor : "white"
		centeredText: "お得な 味噌煮Qtパイは、こちらから\n
(git://github.com/sazus/miso-ni-qtpi.git)"

		Image {
			source: "../res/raspberry_misoni.png"
			z: -2
			width: parent.width
			height: parent.height
			anchors.centerIn: parent.Center
			opacity: 0.3
		}
	}	//

	// qml-presentation-system 4
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "qml-presentation-system moduleのmake(3)"
		titleFontSize: fontSize * 0.9 * fontScale	//title長くて収まらなかったorz

		content: [
			"SDCard Image内に入ったqmlモジュールをSDCardへコピー",
			" 実際にRaspberryPiを動かすために使用するSDCardへコピーします。",
			" コピーするコマンド\n \
$ sudo mkdir -p /media/${SDCardのDirectory}/usr/local/qt5pi/qml/Qt/labs/presentation \n
$ sudo cp ${SDCard Imageをmountしている先}/usr/local/qt5pi/qml/Qt/labs/presentation/* /media/${SDCardのDirectory}/usr/local/qt5pi/qml/Qt/labs/presentation/"
		]
	}	//

	// エレメント説明(構成)
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "エレメント説明(構成)"

		content: [
			"Elements",
			" スライド全体 \r
	Presentation",
			" 各スライド \r
	Slide",
			" コード表示用スライド \r
	CodeSlide"
		]

		CodeSection {
			text: "
import QtQuick 2.1
import Qt.labs.presentation 1.0

Presentation
{
  //プレゼン全体の設定
  property color textColor: \"black\"
  width: 640
  height: 360
  ・・

  // 各スライド毎にSlideエレメントを書いてく。
  Slide { ... }
  Slide { ... }
  ・・

  // コード表示用のSlideエレメントもある。
  CodeSlide{ ... }
}"
		}
	}	//


	// エレメント説明<Presentation>
	Slide {
		isSlide: isView
		SliderFrame {}

		id: _presentation_property
		title: "エレメント説明<Presentation>"

		contentWidth: parent.width / 2
		content: [
			"スライド全体の設定property",
			" スライドタイトル文字列 \r
	titleColor (type:color) \n ",
			" スライド文字列 \r
	textColor (type:color) \n ",
			" フォント指定 \r
	fontFamily (type:string) \r
	  ⇒Slide全般 \r
	codeFontFamily \r
	  (type:string) \r
	  ⇒CodeSlide用 \n ",
		]

		states: [
			State {
				when: _presentation_property.visible;
				PropertyChanges {
					target: _code; y: 0;
				}
			},
			State {
				when: !_presentation_property.visible;
				PropertyChanges {
					target: _code; y: parent.height;
				}
			}
		]
		transitions: Transition {
			PropertyAnimation { properties: "y"; easing.type: Easing.InOutQuad;  duration: 1000}
		}

		//こっからcode表示
		Rectangle {
			id: _code
			x: parent.width / 2 + 30
			y: parent.height
			width: parent.width / 2
			height: parent.height
			color: "lightgreen"
			z: 1.5

			Presentation{
				fontFamily:"TakaoGothic"
				codeFontFamily:"TakaoGothic"
				width: _code.width
				height: _code.height
				titleColor: "red"
				textColor:  "blue"
				CodeSlide {
					title: "Presentation property"
					code:
" Presentation
{
   //文字色をセット
   titleColor: \"red\"
   textColor:  \"blue\"
   //font設定
   fontFamily: \"TakaoGothic\"
   codeFontFamily: \"M+2P+IPAG\"	//	日本語表示できないよ。

   //プレゼンテーションサイズ
   width:  640
   height: 480

   Slide {
	  //Slideの上部タイトル
	  title: \"Presentation property\"

	  //文字
	  centeredText:\"ほら文字が青いでしょ。\"
   }
} "
				}	//CodeSlide
			}	//Presentation

			//_codeのRectAngleをマウスで移動できるように
			MouseArea {
				anchors.fill: parent
				drag.target: _code
			}
		}
	}	//

	// エレメント説明Slide content[]
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "エレメント説明Slide content[]"

		content: [
			"スライドタイトル",
			" title (type:string)",
			"スライドの内容",
			" content: []  (type:variant)",
			"",
			"ほげ",
			" ホゲ",
			"  HOGE",
			"   HOGE",
		]

		CodeSection {
			id: _code_sec_content
		}

		Presentation{
			fontFamily:"TakaoGothic"
			codeFontFamily:"TakaoGothic"
			x: _code_sec_content.x
			y: _code_sec_content.y
			width: _code_sec_content.width
			height: _code_sec_content.height
			titleColor: "red"
			textColor:  "blue"
			CodeSlide {
				title: "Presentation property"
				code:
" Slide
{
  id : _code_sec_content

  title: \"エレメント説明Slide content[]\"

  content: [
   \"スライドタイトル\",
   \" title (type:string)\",
   \"スライドの内容\",
   \" content: []  (type:variant)\",
   \"\",
   \"ほげ\",
   \" ホゲ\",
   \"  HOGE\",
   \"   HOGE\",
  ]
} "
			}	//CodeSlide
		}
	}	//


	// エレメント説明Slide centeredText
	Slide {
		isSlide: isView
		SliderFrame {}

		title: "エレメント説明Slide centeredText"
		id: _slide_centeredText

		centeredText: "centeredText (type:string) \n こんな感じにセンターリングされて表示されるよ。"

		states: [
			State {
				when: _slide_centeredText.visible;
				PropertyChanges {
					target: _code_sec_centeredText_CodeSection; visible: true;
				}
			},
			State {
				when: !_slide_centeredText.visible;
				PropertyChanges {
					target: _code_sec_centeredText_CodeSection; visible: false;
				}
			}
		]
		transitions: Transition {
			PropertyAnimation { properties: "visible"; easing.type: Easing.OutInCubic;  duration: 2000}
		}

		CodeSection {
			id: _code_sec_centeredText_CodeSection
			visible: false;
			x:_slide_centeredText.x
			width:_slide_centeredText.width * 0.9
			opacity: 0.8
		}

		Presentation{
			fontFamily:"TakaoGothic"
			codeFontFamily:"TakaoGothic"
			x: _code_sec_centeredText_CodeSection.x
			y: _code_sec_centeredText_CodeSection.y
			width: _code_sec_centeredText_CodeSection.width
			height: _code_sec_centeredText_CodeSection.height
			visible: _code_sec_centeredText_CodeSection.visible
			titleColor: "red"
			textColor:  "blue"
			CodeSlide {
				title: "Slide property centeredText"
				code:
" Slide
{
  title: \"エレメント説明Slide centeredText\"

  id : _slide_centeredText

  centeredText: \"centeredText (type:string) \\n\nこんな感じにセンターリングされて表示されるよ\"
} "
			}	//CodeSlide
		}	//Presentation
	}	//


	// エレメント説明Slide writeInText  (type:string)
	Slide {
		isSlide: true //isView
		SliderFrame {}

		title: "エレメント説明Slide writeInText"
		id: _slide_writeInText

		writeInText: "writeInText (type:string) \n \
こんな感じにタイピングしたようなかたちで表示されるよ。 \r
\n
<<日本 Qt ユーザー会について>> \r
日本 Qt ユーザー会は Qt に関する情報を日本語で発信すると同時に、\
日本語でのサポートをするという目的で結成されました。 \r
Qt コミュニティは活発でTwitterによる交流をはじめ、勉強会を開催し、\
情報の交流をはかり、イベントに参加し、発表やブース展示による\
情報発信をを行なっています。"

		states: [
			State {
				when: _slide_writeInText.visible;
				PropertyChanges {
					target: _slide_writeInText_CodeSection; visible: true;
				}
			},
			State {
				when: !_slide_writeInText.visible;
				PropertyChanges {
					target: _slide_writeInText_CodeSection; visible: false;
				}
			}
		]
		transitions: Transition {
			PropertyAnimation { properties: "visible"; easing.type: Easing.OutInCubic;  duration: 10000}
		}

		CodeSection {
			id: _slide_writeInText_CodeSection
			visible: false;
			x:_slide_writeInText.x
			width:_slide_writeInText.width * 0.9
			opacity: 0.8
		}

		Presentation{
			fontFamily:"TakaoGothic"
			codeFontFamily:"TakaoGothic"
			x: _slide_writeInText_CodeSection.x
			y: _slide_writeInText_CodeSection.y
			width: _slide_writeInText_CodeSection.width
			height: _slide_writeInText_CodeSection.height
			visible: _slide_writeInText_CodeSection.visible
			titleColor: "red"
			textColor:  "blue"
			CodeSlide {
				title: "Slide property writeInText"
				code:
" Slide
{
  title: \"エレメント説明Slide writeInText\"

  id : _slide_writeInText

  writeInText: \"writeInText (type:string) \\n \r
こんな感じにタイピングしたようなかたちで表示されるよ。 \\r \r
\\n \r
<<日本 Qt ユーザー会について>> \\r \r
日本 Qt ユーザー会は Qt に関する情報を日本語で発信すると同時に、 \\ \r
日本語でのサポートをするという目的で結成されました。 \\r  \r
Qt コミュニティは活発でTwitterによる交流をはじめ、勉強会を開催し、\\ \r
情報の交流をはかり、イベントに参加し、発表やブース展示による\\ \r
情報発信をを行なっています。\"
} "
			}	//CodeSlide
		}	//Presentation
	}	//

	Slide {
		isSlide: isView
		SliderFrame {}

		centeredText: "このプレゼンは \r
こちらにUpしています。 \r
git://github.com/sazus/qt_nagoya9"
	}



}	//Presentation
