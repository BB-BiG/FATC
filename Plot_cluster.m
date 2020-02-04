% figure
% for i=1:173
% plot(x_val(1:2),dataset(c_id(i,3),1:2),'r')
% hold on
% plot(x_val(2:10),dataset(c_id(i,3),2:10),'--r')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 1: Layer 2, Phase H')
% 
% figure
% for i=174:261
% plot(x_val(1:2),dataset(c_id(i,3),1:2),'--g')
% hold on
% plot(x_val(2:5),dataset(c_id(i,3),2:5),'g')
% plot(x_val(5:10),dataset(c_id(i,3),5:10),'--g')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 2: Layer 2, Phase I')

% figure
% for i=262:774
% plot(x_val(1:5),dataset(c_id(i,3),1:5),'--k')
% hold on
% plot(x_val(5:7),dataset(c_id(i,3),5:7),'k')
% plot(x_val(7:10),dataset(c_id(i,3),7:10),'--k')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 3: Layer 2, Phase G1')

% figure
% for i=775:836
% plot(x_val(1:7),dataset(c_id(i,3),1:7),'--b')
% hold on
% plot(x_val(7:10),dataset(c_id(i,3),7:10),'b')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 4: Layer 2, Phase G2')

figure
for i=836:5319
plot(x_val(1:2),dataset(c_id(i,3),1:2),'r')
hold on
plot(x_val(2:10),dataset(c_id(i,3),2:10),'--r')
end
ylim([-4,5])
yticks(layer_array)
grid on
title('Cluster 5: Layer 3, Phase H')
saveas(gcf,'Barchart','epsc')
% 
% figure
% for i=19320:20053
% plot(x_val(1:2),dataset(c_id(i,3),1:2),'--g')
% hold on
% plot(x_val(2:5),dataset(c_id(i,3),2:5),'g')
% plot(x_val(5:10),dataset(c_id(i,3),5:10),'--g')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 6: Layer 3, Phase I')

% figure
% for i=20054:20295
% plot(x_val(1:5),dataset(c_id(i,3),1:5),'--k')
% hold on
% plot(x_val(5:7),dataset(c_id(i,3),5:7),'k')
% plot(x_val(7:10),dataset(c_id(i,3),7:10),'--k')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 7: Layer 3, Phase G1')

% figure
% for i=20296:20328
% plot(x_val(1:7),dataset(c_id(i,3),1:7),'--b')
% hold on
% plot(x_val(7:10),dataset(c_id(i,3),7:10),'b')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 8: Layer 3, Phase G2')
% 
% figure
% for i=20329:20337
% plot(x_val(1:2),dataset(c_id(i,3),1:2),'r')
% hold on
% plot(x_val(2:10),dataset(c_id(i,3),2:10),'--r')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 9: Layer 3, Phase H')
% 
% figure
% for i=20338:20339
% plot(x_val(1:2),dataset(c_id(i,3),1:2),'--g')
% hold on
% plot(x_val(2:5),dataset(c_id(i,3),2:5),'g')
% plot(x_val(5:10),dataset(c_id(i,3),5:10),'--g')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 10: Layer 4, Phase I')
% 
% figure
% for i=20340:20363
% plot(x_val(1:5),dataset(c_id(i,3),1:5),'--k')
% hold on
% plot(x_val(5:7),dataset(c_id(i,3),5:7),'k')
% plot(x_val(7:10),dataset(c_id(i,3),7:10),'--k')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 11: Layer 4, Phase G1')
% 
% figure
% for i=20363:20368
% plot(x_val(1:7),dataset(c_id(i,3),1:7),'--b')
% hold on
% plot(x_val(7:10),dataset(c_id(i,3),7:10),'b')
% end
% ylim([-4,5])
% yticks(layer_array)
% grid on
% title('Cluster 12: Layer 4, Phase G2')