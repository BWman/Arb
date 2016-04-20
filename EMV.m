function [EMVValue,MAEMVValue]=EMV(High,Low,Volume,N,M)
%--------------------此程序用来计算EMV指标(简易波动指标)--------------------
%----------------------------------编写者--------------------------------
%Lian Xiangbin(连长,785674410@qq.com),DUFE,2014
%----------------------------------参考----------------------------------
%[1]光大证券.技术指标系列（九）——EMV 指标改进用法识别尖部能力强，2012-08-23
%[2]交易开拓者(TB).EMV指标的算法
%----------------------------------简介----------------------------------
%简易波动指标（EMV），是为数不多的考虑价量关系的技术指标。它刻画了股价
%在下跌的过程当中，由于买气不断的萎靡退缩，致使成交量逐渐的减少，EMV 数
%值也因而尾随下降，直到股价下跌至某一个合理支撑区，捡便宜货的买单促使成交
%量再度活跃，EMV 数值于是作相对反应向上攀升，当 EMV 数值由负值向上趋近
%于零时，表示部分信心坚定的资金，成功的扭转了股价的跌势，行情不断反转上扬，
%并且形成另一次的买进讯号。
%----------------------------------基本用法------------------------------
%1)EMV在 0 以下表示弱势，在 0 以上表示强势；EMV由负转正应买进，由
%正转负应卖出。 
%2)EMV上穿 MAEMV则买入，EMV下穿 MAEMV则卖出
%----------------------------------调用函数------------------------------
%[EMVValue,MAEMVValue]=EMV(High,Low,Volume,N,M)
%----------------------------------参数----------------------------------
%High-最高价序列
%Low-最低价序列
%Volume-交易量序列
%N-求EMA时所考虑的周期，常用14
%M-求MAEMV时所考虑的周期，常用9
%----------------------------------输出----------------------------------
%EMVValue-EMVValue值
%MAEMVValue-MAEMVValue值

Mid=zeros(length(High),1);
Bro=zeros(length(High),1);
EM=zeros(length(High),1);
EMVValue=zeros(length(High),1);
MAEMVValue=zeros(length(High),1);
Mid(1)=0;
Mid(2:end)=0.5*(High(2:end)+Low(2:end))-0.5*(High(1:end-1)+Low(1:end-1));%Mid>意味着今天的平均价高于昨天的平均价
Bro=(Volume/10000)./(High-Low);
Bro(Bro==inf)=0;%出现停板时，High=Low，这时Bro设为0，处理方法参考的是交易开拓者中(TB)中EMV的算法
EM=Mid./Bro;
EMVValue=MA(EM,N);
MAEMVValue=MA(EMVValue,M);
end


























