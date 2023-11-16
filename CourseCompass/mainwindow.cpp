#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    // Connect the button click to the custom slot
    connect(ui->pushButton, &QPushButton::clicked, this, &MainWindow::onHelloButtonClicked);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::onHelloButtonClicked()
{
    qDebug() << "Hello World button Clicked!";
    ui->groupBox->setTitle("10");
}
