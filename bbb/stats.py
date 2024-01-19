import pandas as pd
import plotly
import plotly.express as px
import matplotlib.pyplot as plt
import mysql.connector

plt.rcParams['font.family'] = 'Malgun Gothic'

# conn = pymysql.connect(host='127.0.0.1', user='root', password='`123', db='test_db', charset='utf8')
# cur = conn.cursor()
# # cur.execute("insert into meminfo values('aaa','123','seok','남','경기도','111-1111','aaa@naver.com','일반회원','O')")
# cur.execute("delete from meminfo where 비밀번호= '123'")
# conn.commit()

remote = mysql.connector.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '`123',
    db = 'test_db',
    charset = 'utf8'
)
cur = remote.cursor()
cursor = remote.cursor(buffered=True)
# cursor.execute("select * from attendance")
#
# result = cursor.fetchall()
# df = pd.DataFrame(result, columns=['날짜','인원'])
# df['인원'] = df['인원'].astype('int')
#
# fig = px.line(df, x='날짜', y='인원', markers=True)
# fig.show()
# fig.write_html('plot.html')

cursor.execute("select * from att")

result = cursor.fetchall()
df = pd.DataFrame(result, columns=['date','cnt'])
df['cnt'] = df['cnt'].astype('int')
df['date'] = pd.to_datetime(df['date'])
df.sort_values(by='date',ascending=True, inplace=True)


fig = px.line(df, x='date', y='cnt', markers=True,)
fig.update_xaxes(title_text='날짜')
fig.update_yaxes(title_text='인원')
# fig.show()
# fig.write_html('plot.html')
# fig.write_json('plot.json')
plotly.offline.plot(fig,'plot2.html')
print(plotly.offline.plot(fig, include_plotlyjs=False, output_type='div'))


# sns.lineplot(x='날짜', y='인원', data=df)
# set_xlabel()
# f = plt.figure(figsize=(20,10))
# plt.plot('날짜','인원',data=df)
# for i in range(len(df['날짜'])):
#     height = df['인원'][i]
#     plt.text(df['날짜'][i], height + 0.25, '%d' %height, ha='center', va='bottom', size = 12)
# plt.xlabel('날짜')
# plt.ylabel('인원')
# print(mpld3.fig_to_html(f, figid='plot'))
# plt.show()

# temp = delivery[['날짜','인원']]

#
# sns.lineplot(x='날짜', y='인원', data=delivery)
#
# plt.legend()
# plt.show()



