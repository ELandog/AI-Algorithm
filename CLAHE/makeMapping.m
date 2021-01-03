function mapping = makeMapping(imgHist,fullRange,numPixInTile)
%�õ�ӳ���ϵ
histSum = cumsum(imgHist);
%cumsum����1�е���m�е�����Ԫ���ۼӺ͡�histSum��Ϊԭͼ����ۻ��ֲ�����
valSpread  = fullRange(2) - fullRange(1);%255-0
  scale =  valSpread/numPixInTile;
  mapping = min(fullRange(1)+histSum*scale,fullRange(2));
end