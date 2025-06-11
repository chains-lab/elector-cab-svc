package presenters

import "github.com/sirupsen/logrus"

type Presenters struct {
	log *logrus.Entry
}

func NewPresenter(log *logrus.Entry) Presenters {
	return Presenters{
		log: log,
	}
}
