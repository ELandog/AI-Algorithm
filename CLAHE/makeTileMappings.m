function tileMappings = makeTileMappings(I, numTiles, dimTile, numBins, clipLimit, fullRange)
%numTiles:8*8
%dimTile:ÿһ���е�������
%numBins:256��ɫ��
%fullRange:[0:255]
numPixInTile = prod(dimTile);%һ��patch�е����ظ���

tileMappings = cell(numTiles);%�����յ�λ���飺����8*8ά�ȵľ���
% extract and process each tile
imgCol = 1;
for col=1:numTiles(2),
  imgRow = 1;
  for row=1:numTiles(1),
    
    tile = I(imgRow:imgRow+dimTile(1)-1,imgCol:imgCol+dimTile(2)-1);
    % input parsing of imhist
    tileHist = imhist(tile, numBins); % column vector������һ�������ϵ�ֱ��ͼ  
    tileHist = clipHistogram(tileHist, clipLimit, numBins);
    tileMapping = makeMapping(tileHist,  fullRange, ...
                              numPixInTile);%ֱ��ͼ����ӳ��
    % assemble individual tile mappings by storing them in a cell array;
    tileMappings{row,col} = tileMapping;%����������յ�ֱ��ͼ����
    imgRow = imgRow + dimTile(1); %�任����һ����
  end
  imgCol = imgCol + dimTile(2); % move to the next column of tiles
end

%-----------------------------------------------------------------------------
% Calculate the equalized lookup table (mapping) based on cumulating the input 
% histogram.  
end