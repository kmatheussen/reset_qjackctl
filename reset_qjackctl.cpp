
#include <QThread>
#include <QTime>
#include <QApplication>

#include <QWidget>
#include <QMessageBox>
#include <QSettings>


#if defined(FOR_WINDOWS)
#include <QtPlugin>
Q_IMPORT_PLUGIN (QWindowsIntegrationPlugin);
#endif



static void showQtWindowInFront(QWidget *window){
  window->setWindowFlags(window->windowFlags() | Qt::Window | Qt::WindowStaysOnTopHint | Qt::MSWindowsFixedSizeDialogHint);
  window->raise();
  window->activateWindow();
  window->show();
}

#define PACKAGE_NAME "QjackCtl"
#define QJACKCTL_DOMAIN     "rncbc.org"
#define QJACKCTL_TITLE      PACKAGE_NAME

static void reset_settings(void){
  QSettings settings(QJACKCTL_DOMAIN, QJACKCTL_TITLE);
  settings.clear();
  settings.sync();
}

int main(int argc, char **argv){
#if defined(FOR_WINDOWS)
  argc = 4;
  const char *argv2[argc] = {argv[0], "-platform", "windows:fontengine=freetype", NULL};
                        
  QApplication app(argc, (char**)argv2);
#else
  QApplication app(argc, argv);
#endif

  //for(auto s : app.arguments())
  //  printf("Arg: -%s-\n",s.toUtf8().constData());

  reset_settings();
  
  QMessageBox *box = new QMessageBox();
  //box->setStandardButtons(0);
  box->setText("qjackctl settings have now been resetted.");
  
  showQtWindowInFront(box);
  
  app.exec();
  
  return 0;
}

