package team.abc.ssm.modules.hr.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import team.abc.ssm.modules.hr.entity.SmallInfo;

public interface SmallInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SmallInfo record);

    int insertOrUpdate(SmallInfo record);

    int insertOrUpdateSelective(SmallInfo record);

    int insertSelective(SmallInfo record);

    SmallInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SmallInfo record);

    int updateByPrimaryKey(SmallInfo record);

    int updateBatch(List<SmallInfo> list);

    int batchInsert(@Param("list") List<SmallInfo> list);
}