#include <QtGui>
#include <QtQml>
#include <QtQuick>

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine(QUrl("qrc:/main.qml"));
	QObject *pObjMain = engine.rootObjects().value(0);
	QQuickWindow *pWindow = qobject_cast<QQuickWindow *>(pObjMain);
	if ( !pWindow ) {
		qDebug("ERROR: rootObject見当たらないっすよ！");
		return -1;
	}
	pWindow->show();

	return app.exec();
}
