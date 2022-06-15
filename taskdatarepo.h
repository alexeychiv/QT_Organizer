#ifndef TASKDATAREPO_H
#define TASKDATAREPO_H

#include <QObject>
#include <QFile>
#include <QDate>


class TaskDataRepo : public QObject
{
    Q_OBJECT


public:
    TaskDataRepo(QObject* parent = nullptr);

    void loadData()
    {
        QFile file("taskData.bin");

        if (file.open(QIODevice::ReadOnly))
        {
            QDataStream reader(&file);

            while (!reader.atEnd())
            {
                QString taskName;
                QString deadlineDate;
                int progress;

                reader >> taskName >> deadlineDate >> progress;

                qDebug() << QString("Task: [%1, %2, %3]").arg(
                                taskName,
                                deadlineDate,
                                QString::number(progress)
                            );
            }
        }
    }

public slots:
    void saveData(const QString& taskName, const QString& deadlineDate, const QString& progress)
    {
        QFile file("taskData.bin");
        file.open(QIODevice::Append);
        QDataStream writer(&file);
        writer << taskName << deadlineDate << progress.toInt();
    }
};

#endif // TASKDATAREPO_H
